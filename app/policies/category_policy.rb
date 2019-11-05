# frozen_string_literal: true

class CategoryPolicy < ApplicationPolicy
  def index?
    ensured_user_authenticated?
  end

  def create?
    ensured_user_authenticated?
  end

  def delete?
    ensured_user_authenticated?
  end
end
