class CreateTask
  class PrepareParams
    include Interactor

    delegate :task_params, to: :context

    def call
      context.prepared_task_params = prepared_task_params
    end

    private

      def prepared_task_params
        task_params
      end
  end
end
