module Types
  module Inputs
    class ProjectInput < Types::BaseInputObject
      argument :name, String, required: true
      argument :description, String, required: false
      argument :user_ids, [ID], required: false
    end
  end
end
