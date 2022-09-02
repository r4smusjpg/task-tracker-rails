class TaskPolicy < ApplicationPolicy
  alias_method :task, :record

  def index?
    user.present?
  end

  def show?
    index?
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def create?
    user.present?
  end

  def update?
    task.project.user_id == user.id
  end

  def destroy?
    update?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

