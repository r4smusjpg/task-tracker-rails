module Mutations
  module ProjectMutations
    class UpdateProject < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :name, String, required: false
      argument :description, String, required: false
      argument :user_ids, [ID], required: false

      type Types::ProjectType

      def resolve(**options)
        result = ::UpdateProject.call(project_params: options, project: ::Project.find_by(id: options[:id]))

        if result.success?
          result.project
        else
          nil
        end
      end
    end
  end
end
