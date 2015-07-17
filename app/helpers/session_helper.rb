#
module SessionHelper
  def avatar(user)
    return image_tag user.avatar.thumb('200x100#').url if user.avatar_stored?
  end

  def signup_link
    return link_to_unless_current 'Sign Up', signup_path unless current_user
    ''
  end

  def login_link
    return link_to 'Login', login_path unless current_user
    ''
  end

  def logout_link
    return link_to 'Logout', logout_path if current_user
    ''
  end

  def user_link
    return link_to 'Account', user_path(current_user) if current_user
    ''
  end

  # def edit_link
  #   return link_to 'edit', edit_user_path(current_user) if user_path(current_user)
  #   ''
  # end
end
