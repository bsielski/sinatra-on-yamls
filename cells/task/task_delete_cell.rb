require "cell"
require "cell/erb"

class TaskDeleteCell < ::Cell::ViewModel
  self.view_paths = ["cells/task"]
  include ::Cell::Erb
  include Layout::External

  def id
    model[:id]
  end

  def data
    model[:data]
  end

  def destroy_action
    "/tasks/delete/#{id}"
  end
end
