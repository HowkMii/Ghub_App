class IdeasController < ApplicationController
  before_action :find_idea, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    if !user_signed_in?
      redirect_to new_user_session_path
    end
    if params[:university_major].blank?
      @ideas = Idea.all.order("created_at DESC")
    else
      @university_major_id = UniversityMajor.find_by(name: params[:university_major]).id
    	@ideas = Idea.where(:university_major_id => @university_major_id).order("created_at DESC")
    end
  end
  def show
    if @idea.discusses.blank?
			@average_discuss = 0
		else
			@average_discuss = @idea.discusses.average(:rating).round(2)
		end
  end
  def new
    @idea = current_user.ideas.build
    @university_majors = UniversityMajor.all.map{ |c| [c.name, c.id] }
  end
  def edit
    @university_majors = UniversityMajor.all.map{ |c| [c.name, c.id] }


  end
  def update
    @idea.university_major_id = params[:university_major_id]
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
    @idea = current_user.ideas.build(idea_params)
    @idea.university_major_id = params[:university_major_id]
      if @idea.save
        redirect_to root_path
      else
        render 'new'
      end


  end
  private
    def idea_params
      params.require(:idea).permit(:title, :content, :Owner,:key_word, :university_major_id, :idea_img)
    end
    def find_idea
      @idea =Idea.find(params[:id])

    end

end
