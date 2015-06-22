#
module SessionHelper
  def signup_link
    link_to 'Sign Up', signup_path unless current_user
  end

  def login_link
    link_to 'Login', login_path unless current_user
  end

  def logout_link
    link_to 'Logout', logout_path if current_user
  end
end