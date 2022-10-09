module Mutations
  class DestroyTask < BaseMutation
    argument :id, ID, required: true

    type Types::TaskType

    def resolve(**options)
      result = ::DestroyTask.call(task: ::Task.find_by(id: options[:id]))

      if result.success?
        result.task
      else
        nil
      end
    end
  end
end
