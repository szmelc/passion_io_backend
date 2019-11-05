# frozen_string_literal: true

class Course < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :category

  validates :name, length: { minimum: 5 }
  validates :name, uniqueness: true
end
