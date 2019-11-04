class Vertical < ApplicationRecord
  has_many :categories, dependent: :destroy

  validates_presence_of :name
  validates_with NameValidator
end
