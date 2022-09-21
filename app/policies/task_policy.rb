class TaskPolicy < ApplicationPolicy
  alias_method :task, :record

  def index?
    user.present?
  end

  def show?
    create?
  end

  def new?
    index?
  end

  def edit?
    create?
  end

  def create?
    task.project.user_ids.include?(user.id)
  end

  def update?
    create?
  end

  def destroy?
    create?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

