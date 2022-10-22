module Mutations
  module TaskMutations
    class CreateTask < Mutations::BaseMutation
      argument :input, Types::Inputs::TaskInput, required: true

      type Types::TaskType

      def resolve(input:)
        result = ::CreateTask.call(task_params: input.to_h)

        if result.success?
          result.task
        else
          nil
        end
      end
    end
  end
end
