class DestroyProject
  include Interactor::Organizer

  organize DestroyProject::DeleteRecord
end
