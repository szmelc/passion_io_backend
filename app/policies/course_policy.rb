# frozen_string_literal: true

class CoursePolicy < ApplicationPolicy
  def index?
    ensured_user_authenticated?
  end

  def create?
    ensured_user_authenticated?
  end

  def delete?
    ensured_record_owner?
  end
end
