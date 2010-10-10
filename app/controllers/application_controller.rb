class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def authorize
    @user = User.find_by_id(session[:user_id])
  end
  
  def require_user
    authorize
    redirect_to new_session_path unless @user
  end

  def authorize_api
    user, pass = get_auth_data
    
    @user = User.authenticate(user, pass)
    
  end

  private
  
  def get_auth_data 
    if request.env.has_key? 'X-HTTP_AUTHORIZATION'          # where mod_rewrite might have put it 
      authdata = request.env['X-HTTP_AUTHORIZATION'].to_s.split 
    elsif request.env.has_key? 'REDIRECT_X_HTTP_AUTHORIZATION'          # mod_fcgi 
      authdata = request.env['REDIRECT_X_HTTP_AUTHORIZATION'].to_s.split 
    elsif request.env.has_key? 'HTTP_AUTHORIZATION'         # regular location
      authdata = request.env['HTTP_AUTHORIZATION'].to_s.split
    end 
    # only basic authentication supported
    if authdata and authdata[0] == 'Basic' 
      user, pass = Base64.decode64(authdata[1]).split(':',2)
    end 
    return [user, pass] 
  end 


end
