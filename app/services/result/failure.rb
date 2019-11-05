# frozen_string_literal: true

module Result
  class Failure < Base
    def success?
      false
    end
  end
end
