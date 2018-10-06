require "cell"
require "cell/erb"

class NoteNewCell < ::Cell::ViewModel
  self.view_paths = ["cells/note"]
  include ::Cell::Erb
  include Layout::External

  def create_action
    "/notes/create"
  end
end
