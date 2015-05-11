class RegisteredApplicationPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    user.present?
  end

  def update?
    create?
  end

  def destroy?
    user.present? && (record.user == user || user.admin? || user.moderator?)
  end

  def show?
    user.present? && (record.user == user || user.admin? || user.moderator?)
  end


end