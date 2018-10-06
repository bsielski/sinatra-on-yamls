require "cell"
require "cell/erb"

class NoteIndexCell < ::Cell::ViewModel
  self.view_paths = ["cells/note"]
  include ::Cell::Erb
  include Layout::External

  def new_action
    "/notes/new"
  end

  def edit_action(id)
    "/notes/edit/#{id}"
  end

  def delete_action(id)
    "/notes/delete/#{id}"
  end
end
