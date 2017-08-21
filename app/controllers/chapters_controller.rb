class ChaptersController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_super_admin_status
  def new
  	@chapter = Chapter.new
    if params[:subject_id]
      @chapter.subject_id = params[:subject_id]
    end
  end
  def create
  	@chapter = Chapter.new(params[:chapter].permit(:name, :subject_id))
  	if @chapter.save
  		redirect_to subject_path(@chapter.subject_id), notice: "Chapter created!"
  	else
  		render action:"new"
  	end
  end

  def edit
  	@chapter = Chapter.find(params[:id])
  end
  def update
  	@chapter = Chapter.find(params[:id])
	if @chapter.update_attributes(params[:chapter].permit(:name, :subject_id))
		redirect_to subject_path(@chapter.subject_id), notice: "Chapter updated!"
	else 
		render action:"edit"
	end
  end  

  def destroy
  	@chapter = Chapter.find(params[:id])
  	if @chapter.destroy
  		redirect_to subject_path(@chapter.subject_id), notice: "Chapter deleted"
  	else
  		redirect_to subject_path(@chapter.subject_id), notice: "Try again"
  	end
  end	
end
