# frozen_string_literal: true

class ApplicationService
  def success(data: nil, message: nil)
    Result::Success.new(data, message)
  end

  def failure(data: nil, message: nil)
    Result::Failure.new(data, message)
  end
end
