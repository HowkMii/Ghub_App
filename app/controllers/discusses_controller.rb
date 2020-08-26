class DiscussesController < ApplicationController
  before_action :find_idea
  before_action :find_discuss, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

 def new
   @discuss = Discuss.new
 end

 def create
   @discuss = Discuss.new(discuss_params)
   @discuss.idea_id = @idea.id
   @discuss.user_id = current_user.id

   if @discuss.save
     redirect_to idea_path(@idea)
   else
     render 'new'
   end
 end

 def edit
 end

 def update
   if @discuss.update(discuss_params)
     redirect_to idea_path(@idea)
   else
     render 'edit'
   end
 end

 def destroy
   @discuss.destroy
   redirect_to idea_path(@idea)
 end

 private

   def discuss_params
     params.require(:discuss).permit(:rating, :comment)
   end

   def find_idea
     @idea = Idea.find(params[:idea_id])
   end

   def find_discuss
     @discuss = Discuss.find(params[:id])
   end

end
