class UserService
  def self.update(user, params)
    params[:full_profile_attributes] = params.delete(:full_profile) || {}

    user.update(params)
  end
end
