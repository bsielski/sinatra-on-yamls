require "cell"
require "cell/erb"
require_relative "./note_item_cell"

class NoteIndexCell < ::Cell::ViewModel
  self.view_paths = ["cells/note"]
  include ::Cell::Erb
  include Layout::External

  def new_action
    "/notes/new"
  end

  def show_action(id)
    "/notes/#{id}"
  end

  def edit_action(id)
    "/notes/edit/#{id}"
  end

  def delete_action(id)
    "/notes/delete/#{id}"
  end
end
