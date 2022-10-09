class DestroyTask
  class DeleteRecord
    include Interactor

    delegate :task, to: :context

    def call
      context.task = task
      context.fail!(error: 'Invalid data') unless task.destroy
    end
  end
end
