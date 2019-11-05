# frozen_string_literal: true

class VerticalSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :categories
end
