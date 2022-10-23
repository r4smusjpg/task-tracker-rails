module Types
  module Payloads
    class TaskPayload < Types::BaseObject
      field :task, Types::TaskType, null: true, method: :task
      field :errors, [Types::Payloads::Error], null: true
    end
  end
end
