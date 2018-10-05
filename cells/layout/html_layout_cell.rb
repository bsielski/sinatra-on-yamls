require "cell"
require "cell/erb"
require_relative "../../config/application"

class HtmlLayoutCell < Cell::ViewModel
  self.view_paths = ["cells/layout"]
  include ::Cell::Erb

  def version
    Application::VERSION
  end
end
