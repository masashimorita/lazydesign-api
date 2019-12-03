module LazyDesign
  class ApplicationError < StandardError
    def self.status_code status
      define_method :status_code do
        status
      end
    end

    def self.error_message error_message
      define_method :error_message do
        self.message || error_message
      end
    end
  end

  class BadRequest < ApplicationError
    status_code 400
    error_message "Bad Request"
  end

  class ForbiddenError < ApplicationError
    status_code 403
    error_message "Forbidden Operation"
  end

  class NotFoundError < ApplicationError
    status_code 404
    error_message "Record Not Found"
  end

  class ConflictError < ApplicationError
    status_code 409
    error_message "Record Conflict Occurred"
  end

  class InvalidParameterError < ApplicationError
    status_code 422
    error_message "Invalid API Parameter was given"
  end
end
