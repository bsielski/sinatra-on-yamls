require "cell"
require "cell/erb"

class TaskNewCell < ::Cell::ViewModel
  self.view_paths = ["cells/task"]
  include ::Cell::Erb
  include Layout::External

  def data
    model[:data]
  end
end
