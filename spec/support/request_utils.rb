module RequestUtils
  def get_with_auth(path, params = {}, headers = {})
    get path, params: params, headers: headers.merge(auth_header)
  end

  def post_with_auth(path, params = {}, headers = {})
    post path, params: params, headers: headers.merge(auth_header)
  end

  def put_with_auth(path, params = {}, headers = {})
    put path, params: params, headers: headers.merge(auth_header)
  end

  def delete_with_auth(path, params = {}, headers = {})
    delete path, params: params, headers: headers.merge(auth_header)
  end

  private
  def auth_header
    current_user ||= create(:user)
    token_info = Knock::AuthToken.new payload: { sub: current_user.id }
    { Authorization: "Bearer #{token_info.token}" }.with_indifferent_access
  end
end
