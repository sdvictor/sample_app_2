class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end
  
  def create
    puts params
    user = User.authenticate(params[:session][:email], params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'    
    else
      signin user
      redirect_to user
    end
  end
  
  def destroy
    signout
    redirect_to root_path
  end

end
