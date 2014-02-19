class UsersController < ApplicationController
  def create
    user = User.new(params[:user])
    if user.save
      redirect_to user_path(user)
    else
      # render home page
    end
  end
end