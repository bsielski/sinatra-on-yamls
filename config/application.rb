require "pathname"

module Application
  ROOT_DIR = Pathname.new(__FILE__).dirname.parent.to_s
  VERSION = "0.1.3"
end
