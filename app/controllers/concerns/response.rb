require "active_support"

module Response
  extend ActiveSupport::Concern

  def json_response(object, serializer = nil, status = 200)
    response = { json: object, status: status }
    response.merge({ serializer: serializer }) if serializer
    render response
  end

  # 200 Success
  def response_success(object, serializer = nil)
    json_response(object, serializer, 200)
  end

  # 201 Item Created
  def response_item_created(object, serializer = nil)
    json_response(object, serializer,201)
  end

  # 400 Bad Request
  def response_bad_request
    json_response({message: "Bad Request" }, nil,400)
  end

  # 401 Unauthorized
  def response_unauthorized
    json_response({message: "Unauthorized" }, nil, 401)
  end

  # 404 Not Found
  def response_not_found(message = "Not Found Error")
    json_response({message: message}, nil, 404)
  end

  # 409 Conflict
  def response_conflict(message = "Conflict Error")
    json_response({message: message}, nil, 409)
  end

  # 500 Internal Server Error
  def response_internal_server_error
    json_response({message: "Internal Server Error"}, nil, 500)
  end
end
