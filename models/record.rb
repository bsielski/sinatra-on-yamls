require 'yaml/store'
require_relative '../config/application'

module Record
  class Load
    def initialize(directory, store_class: YAML::Store)
      @directory = directory
      @store_class = store_class
    end

    def call(id)
      abs_path = Application::ROOT_DIR + "/db/#{@directory}/#{id}.yml"
      store = @store_class.new(abs_path)
      store.transaction { store[:data] }
    end
  end

  class Save
    def initialize(directory, store_class: YAML::Store)
      @directory = directory
      @store_class = store_class
    end

    def call(id, data)
      abs_path = Application::ROOT_DIR + "/db/#{@directory}/#{id}.yml"
      store = @store_class.new(abs_path)
      store.transaction do
        store[:data] = {id: id, data: data}
      end
      store.transaction { store[:data] }      
    end
  end

  class All
    def initialize(directory, store_class: YAML::Store)
      @directory = directory
      @store_class = store_class
    end

    def call
      abs_dir_path = Application::ROOT_DIR + "/db/#{@directory}"
      file_paths = Dir.glob(abs_dir_path + "/*.yml").select {|f| File.file?(f)}
      file_paths.map do |file_path|
        store = @store_class.new(file_path)
        store.transaction { store[:data] }
      end
    end
  end

  class Delete
    def initialize(directory, store_class: YAML::Store)
      @directory = directory
      @store_class = store_class
    end

    def call(id)
      abs_dir_path = Application::ROOT_DIR + "/db/#{@directory}"
      file_path = "#{abs_dir_path}/#{id}.yml"
      File.delete(file_path)
      id
    end
  end
end
