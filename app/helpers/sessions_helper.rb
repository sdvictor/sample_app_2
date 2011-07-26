module SessionsHelper
  def signin user
    @current_user = user
    cookies.permanent.signed[:signin_user] = [user.id, user.salt]
  end
  
  def signout
    current_user = nil
    cookies.delete(:signin_user)
  end
  
  def signed_in?
    current_user.present?
  end
  
  def current_user
    @current_user || user_from_cookie
  end
  
  def current_user= user
    @current_user = user
  end
  
  def user_from_cookie
    id, salt = id_salt_from_cookie
    User.authenticate_by_salt(id, salt)
  end
  
  def id_salt_from_cookie
    cookies.signed[:signin_user] || [nil, nil]
  end
  
  def deny_access
    store_location
    redirect_to signin_path, :notice => "Please sign in first"
  end
  
  def current_user? user
    current_user == user
  end
  
  def return_back_or(default)
    redirect_to (session[:return_to] || default)
    clear_return_to
  end
  
  private
  
  def store_location
    session[:return_to] = request.fullpath
  end
  
  def clear_return_to
    session[:return_to] = nil
  end
  
end
