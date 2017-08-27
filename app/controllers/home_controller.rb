class HomeController < ApplicationController
  def index
  	if user_signed_in? && current_user.role_id == 2
  		@chapters = Chapter.all.includes(:subject)
  		@events =  Schedule.where('learner_id = ? AND confirmed = ?', current_user.learner.id, true).order(:date_time_of_class)
  	elsif user_signed_in? && (current_user.role_id == 4 || current_user.role_id == 5)
  		@events =  Schedule.where('educator_id = ? AND confirmed = ?', current_user.educator.id, true).order(:date_time_of_class)
  	end
  end
end
