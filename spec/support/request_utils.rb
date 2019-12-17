module RequestUtils
  def get_with_auth(path, params = {}, headers = {}, is_admin = false)
    get path, params: params, headers: headers.merge(auth_header(is_admin))
  end

  def post_with_auth(path, params = {}, headers = {}, is_admin = false)
    post path, params: params, headers: headers.merge(auth_header(is_admin))
  end

  def put_with_auth(path, params = {}, headers = {}, is_admin = false)
    put path, params: params, headers: headers.merge(auth_header(is_admin))
  end

  def delete_with_auth(path, params = {}, headers = {}, is_admin = false)
    delete path, params: params, headers: headers.merge(auth_header(is_admin))
  end

  private
  def auth_header(is_admin)
    if is_admin
      payload = { admin_id: (current_admin rescue create(:admin)).id }
    else
      payload = { user_id: (current_user rescue create(:user)).id }
    end
    token_info = Knock::AuthToken.new payload: payload
    { Authorization: "Bearer #{token_info.token}" }.with_indifferent_access
  end
end
