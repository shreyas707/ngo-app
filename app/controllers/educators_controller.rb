class EducatorsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_educator_status
  def new
  	@educator = Educator.new
  end

  def create
  	@educator = Educator.new(params[:educator].permit(:weekly_goal, :certificate_required, subject_ids:[]))
    @educator.user_id = current_user.id 
    @educator.total_hours_logged = 0.0
    @educator.weekly_hours_logged = 0.0
    @educator.certificate_required = true
    binding.pry
  	if @educator.save
  		redirect_to root_path, notice: "Nice, lets start"
  	else
      binding.pry
  		render action:"new"
  	end
  end
  def edit
    @educator = current_user.educator
  end
  def show
    @requests = current_user.educator.requests
  end
  def update
    @educator = Educator.find(params[:id])
    if @educator.update_attributes(params[:educator].permit(:weekly_goal, :certificate_required, subject_ids:[]))
      redirect_to root_path, notice: "Profile updated!"
    else
      render action:"edit"
    end
  end

  def destroy
  end
end
