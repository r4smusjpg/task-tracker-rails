module Types
  module Payloads
    class ProjectPayload < Types::BaseObject
      field :project, Types::ProjectType, null: true, method: :project
      field :errors, [Types::Payloads::Error], null: true
    end
  end
end
