class LearnersController < ApplicationController
  before_action :authenticate_user!, except:[:new, :create]
  def new
  	@learner = Learner.new
  	if params[:user_id]
  		@learner.user_id = params[:user_id]
  	end
  end
  def create
  	@learner = Learner.new(params[:learner].permit(:grade, :start_time, :end_time, :user_id))
  	if @learner.save
  		redirect_to admin_users_path, notice:"Learner successfully created"
  	else
  		render action:"new"
  	end
  end

  def show
    @learner = Learner.find_by(user_id: params[:user_id])
  end

  def edit
    @learner = current_user.learner
  end
  def update
    @learner = Learner.find(params[:id])
    if @learner.update_attributes(params[:learner].permit(:grade, :start_time, :end_time, :grade))
      redirect_to root_path, notice: "Profile updated!"
    else
      render action:"edit"
    end
  end
  
  def destroy
  	@learner = Learner.find(params[:id])
  	@learner.destroy
  end
end
