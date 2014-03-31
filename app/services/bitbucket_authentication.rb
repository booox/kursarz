class BitbucketAuthentication
  class << self
    def from_omniauth(auth)
      User.where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
    end

    private

    def create_from_omniauth(auth)
      user.uid = auth["uid"].to_s
      user.provider = auth["provider"]
      user.login = auth["info"]["email"]
      user.name = auth["info"]["name"]
      user.description = auth["info"]['description']
      user.location = auth['info']['location']
      user.avatar_url = auth['info']['avatar']
    end
  end
end
