require 'lazy_design/errors'

class ApplicationController < ActionController::API
  include Response
  include Pagy::Backend

  rescue_from StandardError do |e|
    Rails.logger.error e.message
    Rails.logger.error e.backtrace.join("\n")

    if e.is_a? ActiveRecord::RecordInvalid
      self.json_response({message: e.message}, nil, 400)
    elsif e.is_a? ActiveRecord::RecordNotFound
      self.response_not_found
    elsif e.is_a? LazyDesign::ApplicationError
      self.json_response({message: e.error_message}, nil, e.status_code)
    else
      self.response_internal_server_error
    end
  end
end
