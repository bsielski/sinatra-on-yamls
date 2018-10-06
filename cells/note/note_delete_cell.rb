require "cell"
require "cell/erb"

class NoteDeleteCell < ::Cell::ViewModel
  self.view_paths = ["cells/note"]
  include ::Cell::Erb
  include Layout::External

  def id
    model[:id]
  end

  def title
    model[:title]
  end

  def body
    model[:body]
  end

  def destroy_action
    "/notes/destroy/#{id}"
  end
end
