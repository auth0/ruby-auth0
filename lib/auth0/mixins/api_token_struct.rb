ApiToken = Struct.new :access_token, :scope, :expires_in do
  def token
    access_token
  end

  def scopes
    scope.split
  end
end
