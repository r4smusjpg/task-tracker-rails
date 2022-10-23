module Mutations
  module TaskMutations
    class CreateTask < Mutations::BaseMutation
      argument :input, Types::Inputs::TaskInput, required: true

      type Types::Payloads::TaskPayload

      def resolve(input:)
        result = ::CreateTask.call(task_params: input.to_h)

        if result.success?
          result.to_h
        else
          format_errors(task: result.task)
        end
      end
    end
  end
end
