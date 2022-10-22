module Mutations
  module TaskMutations
    class UpdateTask < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :title, String, required: false
      argument :description, String, required: false
      argument :deadline_at, GraphQL::Types::ISO8601DateTime, required: false
      argument :status, String, required: false

      type Types::TaskType

      def resolve(**options)
        result = ::UpdateTask.call(task_params: options, task: ::Task.find_by(id: options[:id]))

        if result.success?
          result.task
        else
          nil
        end
      end
    end
  end
end
