module Mutations
  module ProjectMutations
    class DestroyProject < Mutations::BaseMutation
      argument :id, ID, required: true

      type Types::Payloads::ProjectPayload

      def resolve(**options)
        result = ::DestroyProject.call(project: ::Project.find_by(id: options[:id]))

        if result.success?
          result.to_h
        else
          nil
        end
      end
    end
  end
end
