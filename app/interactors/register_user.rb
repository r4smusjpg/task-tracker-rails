class RegisterUser
  include Interactor::Organizer

  organize RegisterUser::PrepareParams,
           RegisterUser::SaveRecord
end
