require "cell"
require "cell/erb"

class MenuBarCell < Cell::ViewModel
  self.view_paths = ["views"]
  include ::Cell::Erb
end
