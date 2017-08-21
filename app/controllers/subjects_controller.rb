class SubjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_super_admin_status
  def index
  	@subjects = Subject.all
  end

  def edit
  	@subject = Subject.find(params[:id])
  end
  def update
  	@subject = Subject.find(params[:id])
  	if @subject.update_attributes(params[:subject].permit(:name))
  		redirect_to subject_path(@subject.id), notice: "Subject updated!"
  	else
  		render action:"edit"
  	end
  end

  def new
  	@subject= Subject.new
  end
  def create
  	@subject = Subject.new(params[:subject].permit(:name))
  	if @subject.save
  		redirect_to subjects_path, notice: "Subject created!"
  	else
      render action:"new"
  	end
  end

  def destroy
    @subject = Subject.find(params[:id])
    if @subject.destroy
      redirect_to subjects_path, notice: "Sucject deleted"
    else 
      redirect_to subject_path(@subject.id), notice: "Try again"
    end
  end
  
  def show
  	@subject = Subject.find(params[:id])
  end
end
