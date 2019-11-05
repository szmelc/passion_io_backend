# frozen_string_literal: true

class VerticalPolicy < ApplicationPolicy
  def index?
    ensured_user_authenticated?
  end
end
