# frozen_string_literal: true

module CategoryServices
  class Create < ApplicationService
    attr_reader :params

    def initialize(params)
      @params = params
    end

    def call
      create_category
    end

    private

    def create_category
      category = Category.new(params)
      category.save ? success(data: category.reload, message: 'Category successfully created') : failure(data: category)
    end
  end
end
