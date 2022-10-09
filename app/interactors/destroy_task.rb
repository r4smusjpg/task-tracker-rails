class DestroyTask
  include Interactor::Organizer

  organize DestroyTask::DeleteRecord
end
