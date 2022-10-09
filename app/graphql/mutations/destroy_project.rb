module Mutations
  class DestroyProject < BaseMutation
    argument :id, ID, required: true

    type Types::ProjectType

    def resolve(**options)
      result = ::DestroyProject.call(project: ::Project.find_by(id: options[:id]))

      if result.success?
        result.project
      else
        nil
      end
    end
  end
end
