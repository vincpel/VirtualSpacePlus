class SessionsController < ApplicationController
  protect_from_forgery
  def new
  end


  def create
    user = User.find_by_email(params[:session][:email])
    #if @user.password == params[:session][:password]
    if user && user.authenticate(params[:session][:password])
      #give_token
      log_in user
      redirect_to user
      #render html: 'ok'
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
      #redirect_to home_url
    end
  end

  def destroy

  end
    
  
end
