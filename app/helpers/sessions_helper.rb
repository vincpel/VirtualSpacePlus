module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  def checkUserIsLogedIn?
    if 
      user_signed_in?
    else
      redirect_to new_user_session
    end
  end

end
