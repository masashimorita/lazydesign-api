require "active_support"

module Response
  extend ActiveSupport::Concern

  def json_response(object, status = 200)
    render json: object, status: status
  end

  # 200 Success
  def response_success(object)
    json_response(object, 200)
  end

  # 201 Item Created
  def response_item_created(object)
    json_response(object, 201)
  end

  # 400 Bad Request
  def response_bad_request
    json_response({message: "Bad Request" }, 400)
  end

  # 401 Unauthorized
  def response_unauthorized
    json_response({message: "Unauthorized" }, 401)
  end

  # 404 Not Found
  def response_not_found(message = "Not Found Error")
    json_response({message: message}, 404)
  end

  # 409 Conflict
  def response_conflict(message = "Conflict Error")
    json_response({message: message}, 409)
  end

  # 500 Internal Server Error
  def response_internal_server_error
    json_response({message: "Internal Server Error"}, 500)
  end
end
