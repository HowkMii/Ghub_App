class IdeasController < ApplicationController
  before_action :find_idea, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    if !user_signed_in?
      redirect_to new_user_session_path

    end
    @ideas = Idea.all.order("created_at DESC")

  end
  def show
  end
  def new
    @idea = Idea.new
  end
  def edit

  end
  def update
    if @idea.update(idea_params)
      redirect_to idea_path(@idea)
		else
			render 'edit'
		end


  end
  def destroy
    @idea.destroy
		redirect_to root_path

  end
  def create
    @idea = Idea.new(idea_params)
      if @idea.save
        redirect_to root_path
      else
        render 'new'
      end


  end
  private
    def idea_params
      params.require(:idea).permit(:title, :content, :Owner)
    end
    def find_idea
      @idea =Idea.find(params[:id])

    end

end
