class SessionsController < ApplicationController

  def new

  end

  def create
    if :emailOrName.to_s.include? '@'
      user = User.find_by_email(params[:session][:emailOrName].downcase)
    else
      user = User.find_by_name(params[:session][:emailOrName].downcase)
    end
    if user && user.authenticate(params[:session][:password])
      sing_in user
      redirect_to user
    else
      flash.now[:error] = 'Invalid email or name and password combination'
      render 'new'
    end
  end

  def destroy
    sing_out
    redirect_to root_url
  end
end
