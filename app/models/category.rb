class Category < ApplicationRecord
  belongs_to :vertical
  has_many :courses, dependent: :destroy

  validates :name, length: { minimum: 3 }, uniqueness: true
  validates_presence_of :name, :state
  validates_with NameValidator

  enum state: { active: 1, inactive: 0 }
end
