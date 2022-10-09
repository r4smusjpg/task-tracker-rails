class DestroyComment
  include Interactor::Organizer

  organize DestroyComment::DeleteRecord
end
