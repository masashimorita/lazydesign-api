module LazyDesign
  class ApplicationError < StandardError
    def self.status_code status
      define_method :status_code do
        status
      end
    end

    def self.error_message message
      define_method :error_message do
        message
      end
    end
  end

  class BadRequest < ApplicationError
    status_code 400
    error_message "Bad Request"
  end

  class NotFoundError < ApplicationError
    status_code 404
    error_message "Record Not Found"
  end

  class ConflictError < ApplicationError
    status_code 409
    error_message "Record Conflict Occurred"
  end
end
