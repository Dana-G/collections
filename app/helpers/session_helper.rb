#
module SessionHelper
  def signup_link
    return link_to 'Sign Up', signup_path unless current_user
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

  def edit_link
    return link_to 'edit', edit_user_path(current_user) if current_user
    ''
  end

  def avatar(user)
    return image_tag user.avatar.thumb('200x100#').url if user.avatar_stored?
  end
end
