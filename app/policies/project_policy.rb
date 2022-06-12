class ProjectPolicy < ApplicationPolicy
  alias_method :project, :record

  def index?
    user.present?
  end

  def show?
    user.present?
  end

  def create?
    user.present?
  end

  def update?
    user.present?
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
