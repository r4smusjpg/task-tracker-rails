module Resolvers
  module TaskResolvers
    class Task < Resolvers::Base
      argument :id, ID, required: true
      
      type Types::TaskType, null: false

      def resolve(**params)
        ::Task.find_by(id: params[:id])
      end
    end
  end
end
