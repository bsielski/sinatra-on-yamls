require "cell"
require "cell/erb"

class NoteShowCell < ::Cell::ViewModel
  self.view_paths = ["cells/note"]
  include ::Cell::Erb
  include Layout::External

  def id
    model.id
  end

  def title
    model.title
  end

  def body
    model.body
  end

  def edit_action
    "/notes/edit/#{id}"
  end
end
