module Mutations
  module ProjectMutations
    class UpdateProject < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :name, String, required: false
      argument :description, String, required: false
      argument :user_ids, [ID], required: false

      type Types::Payloads::ProjectPayload

      def resolve(**options)
        result = ::UpdateProject.call(project_params: options, project: ::Project.find_by(id: options[:id]))

        if result.success?
          result.to_h
        else
          format_errors(project: result.project)
        end
      end
    end
  end
end
