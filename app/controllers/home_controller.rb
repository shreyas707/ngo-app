class HomeController < ApplicationController
  def index
  	if user_signed_in? && current_user.role_id == 2
  		@chapters = Chapter.all.includes(:subject)
  		@events = Schedule.where('learner_id = ? AND confirmed = ?', current_user.learner.id, true)

  	end
  end
end
