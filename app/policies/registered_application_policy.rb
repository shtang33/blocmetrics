class RegisteredApplicationPolicy < ApplicationPolicy

  def index?
    # true
    user.present?
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
    user.present?
    # user.present? && (record.user == user || user.admin? || user.moderator?)
  end


end