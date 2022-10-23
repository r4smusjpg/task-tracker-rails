module Mutations
  module TaskMutations
    class DestroyTask < Mutations::BaseMutation
      argument :id, ID, required: true

      type Types::Payloads::TaskPayload

      def resolve(**options)
        result = ::DestroyTask.call(task: ::Task.find_by(id: options[:id]))

        if result.success?
          result.to_h
        else
          nil
        end
      end
    end
  end
end
