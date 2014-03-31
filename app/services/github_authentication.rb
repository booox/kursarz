class GithubAuthentication
  class << self
    def from_omniauth(auth)
      User.where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
    end

    private

    def create_from_omniauth(auth)
      User.create! do |user|
        user.uid = auth["uid"].to_s
        user.provider = auth["provider"]
        user.login = auth["info"]["nickname"]
        user.name = auth["info"]["name"]
        user.description = auth["info"]['description']
        user.location = auth['info']['location']
        user.website = auth['info']['urls']['Website']
        user.avatar_url = auth['info']['image'].sub("_normal", "")
      end
    end
  end
end
