# frozen_string_literal: true

module CourseServices
  class Create < ApplicationService
    attr_reader :params, :user

    def initialize(params, user)
      @params = params
      @user = user
    end

    def call
      create_course
    end

    private

    def create_course
      course = user.courses.new(params)
      course.save ? success(data: course.reload, message: 'Course successfully created') : failure(data: course)
    end
  end
end
