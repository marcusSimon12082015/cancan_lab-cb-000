class SessionController < ApplicationController
  def create
    user = User.find_by(name:params[:name])
    session[:id] = user.id
  end

  def destroy
  end
end
