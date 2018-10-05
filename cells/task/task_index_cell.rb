require "cell"
require "cell/erb"

class TaskIndexCell < ::Cell::ViewModel
  self.view_paths = ["cells/task"]
  include ::Cell::Erb
  include Layout::External

  def delete_href(id)
    "/tasks/delete/#{id}"
  end
end
