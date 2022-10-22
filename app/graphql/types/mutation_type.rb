module Types
  class MutationType < Types::BaseObject
    # user mutations
    field :sign_up, mutation: Mutations::SignUp

    # projects mutations
    field :create_project, mutation: Mutations::ProjectMutations::CreateProject
    field :update_project, mutation: Mutations::ProjectMutations::UpdateProject
    field :destroy_project, mutation: Mutations::ProjectMutations::DestroyProject

    # tasks mutations
    field :create_task, mutation: Mutations::TaskMutations::CreateTask
    field :update_task, mutation: Mutations::TaskMutations::UpdateTask
    field :destroy_task, mutation: Mutations::TaskMutations::DestroyTask

    # comments mutations
    field :create_comment, mutation: Mutations::CreateComment
    field :update_comment, mutation: Mutations::UpdateComment
    field :destroy_comment, mutation: Mutations::DestroyComment
  end
end
