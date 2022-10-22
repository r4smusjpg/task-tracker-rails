module Types
  module Inputs
    class TaskInput < Types::BaseInputObject
      argument :title, String, required: true
      argument :description, String, required: false
      argument :deadline_at, GraphQL::Types::ISO8601DateTime, required: true
      argument :project_id, ID, required: true
      argument :status, String, required: true
    end
  end
end
