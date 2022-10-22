module Resolvers
  module ProjectResolvers
    class Projects < Resolvers::Base
      type [Types::ProjectType], null: false

      def resolve(**_options)
        ::Project.all
      end
    end
  end
end
