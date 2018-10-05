require "cell"
require "cell/erb"

class MenuBarLinkCell < Cell::ViewModel
  self.view_paths = ["views"]
  include ::Cell::Erb
  include Layout::External

  def text
    options[:text]
  end
  def href
    options[:href]
  end
end
