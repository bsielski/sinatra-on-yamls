require "yaml_record"
require_relative '../config/application'

class Note < YamlRecord::Base
  properties :title, :body
  adapter :local
  source Application::ROOT_DIR + "/db/notes"
end
