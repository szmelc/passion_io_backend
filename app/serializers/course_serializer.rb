# frozen_string_literal: true

class CourseSerializer < ActiveModel::Serializer
  attributes :id, :author, :name, :category_id, :state
end
