class UpdateTask
  class UpdateRecord
    include Interactor

    delegate :task_params, :task, to: :context

    def call
      context.task = task
      context.fail!(error: 'Invalid data') unless task.update(task_params)
    end
  end
end
