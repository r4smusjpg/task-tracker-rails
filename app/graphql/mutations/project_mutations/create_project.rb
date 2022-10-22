module Mutations
  module ProjectMutations
    class CreateProject < Mutations::BaseMutation
      argument :input, Types::Inputs::ProjectInput, required: true

      type Types::ProjectType

      def resolve(input:)
        result = ::CreateProject.call(project_params: input.to_h, current_user: current_user)

        if result.success?
          result.project
        else
          nil
        end
      end
    end
  end
end
