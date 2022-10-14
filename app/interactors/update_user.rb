class UpdateUser
  include Interactor::Organizer

  organize UpdateUser::UpdateRecord
end
