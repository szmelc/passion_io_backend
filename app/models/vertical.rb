# frozen_string_literal: true

class Vertical < ApplicationRecord
  has_many :categories, dependent: :destroy

  validates :name, presence: true
  validates_with NameValidator
end
