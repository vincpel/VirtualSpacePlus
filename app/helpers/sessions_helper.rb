module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  def ifLoggin(user)
    if session[:user_id] == user.id

    else
      redirect_to login_url
    end
  end

end
