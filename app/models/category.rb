class Category < ApplicationRecord
  belongs_to :vertical
  has_many :courses, dependent: :destroy

  validates_presence_of :name, :state

  enum state: { active: 1, inactive: 0 }
end
