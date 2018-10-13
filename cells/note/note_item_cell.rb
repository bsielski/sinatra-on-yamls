require "cell"
require "cell/erb"
require "bsielski/trunctate_by_char"

class NoteItemCell < ::Cell::ViewModel
  self.view_paths = ["cells/note"]
  include ::Cell::Erb
  include Layout::External

  def id
    model.id
  end

  def shorten_id
    BSielski::TrunctateByChar.new(limit: 5, suffix: "...").call(id)
  end

  def title
    model.title
  end

  def body
    model.body
  end

  def show_action
    "/notes/#{id}"
  end

  def edit_action
    "/notes/edit/#{id}"
  end

  def delete_action
    "/notes/delete/#{id}"
  end
end
