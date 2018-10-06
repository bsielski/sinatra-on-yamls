require "cell"
require "cell/erb"

class NoteEditCell < ::Cell::ViewModel
  self.view_paths = ["cells/note"]
  include ::Cell::Erb
  include Layout::External

  def title
    model.title
  end

  def body
    model.body
  end

  def update_action
    "/notes/update/#{model[:id]}"
  end
end
