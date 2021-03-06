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

  def trunctated_id
    BSielski::TrunctateByChar.new(limit: 6, suffix: "...").call(id)
  end

  def title
    model.title
  end

  def trunctated_title
    BSielski::TrunctateByChar.new(limit: 30, suffix: "...").call(title)
  end

  def body
    model.body
  end

  def trunctated_body
    BSielski::TrunctateByChar.new(limit: 40, suffix: "...").call(body)
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
