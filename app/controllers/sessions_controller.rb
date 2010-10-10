class SessionsController < ApplicationController
  layout 'application'

  def new
  end

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to new_session_path, :alert => "EPIC FAIL of Anthony proportions"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
