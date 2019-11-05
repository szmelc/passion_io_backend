# frozen_string_literal: true

module Result
  class Base < ApplicationService
    attr_reader :data, :message

    def initialize(data, message)
      @data = data
      @message = message
    end
  end
end
