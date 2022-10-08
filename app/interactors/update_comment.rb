class UpdateComment
  include Interactor::Organizer

  organize UpdateComment::UpdateRecord
end
