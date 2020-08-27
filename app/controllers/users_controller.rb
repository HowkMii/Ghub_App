class UsersController < ApplicationController
  def index
    @users = User.search(params[:term])
    respond_to :js


  end
  def show
    @user = User.find(params[:id])
    @ideas = @user.ideas.includes(:idea_img)
  end


end
