require "cell"
require "cell/erb"

class HomePageCell < ::Cell::ViewModel
  self.view_paths = ["cells"]
  include ::Cell::Erb
  include Layout::External
end
