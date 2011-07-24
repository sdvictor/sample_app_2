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
  
end
