class SchedulesController < ApplicationController
	before_action :authenticate_user!
	def index
		if current_user.role_id == 2
			@events = Schedule.where('learner_id = ? AND confirmed = ?', current_user.learner.id, true)
		else
			@events = Schedule.where('educator_id = ? AND confirmed = ?', current_user.educator.id, true)
		end
	end
	def show
		if current_user.role_id == 2
			@event = current_user.learner.schedules.first # a learner can only have one meeting at a time
		else
			@event = Schedule.where('date_time_of_class <= ? AND educator_id = ?',  DateTime.now, current_user.educator.id).first
		end
	end
	def new
		@schedule = Schedule.new
	end
	def create
		@schedule = Schedule.new
		@schedule.chapter_id = params[:chapter_id]
		@schedule.learner_id = current_user.learner.id 
		if @schedule.save
			redirect_to root_path, notice: "Your request has been recorded. We'll notify you when we find you a tutor"

		else
			redirect_to root_path, notice: "Sorry, the request failed. Please try again"
		end
	end

	def edit
		@schedule = Schedule.find(params[:id])
	end
	def update
		@schedule = Schedule.find(params[:id])
		# if @schedule.educator_id && @schedule.confirmed && @schedule.date_time_of_class
		# 	@schedule.duration = 5
		# else
			@schedule.educator_id = current_user.educator.id
			@schedule.confirmed = true
			@schedule.date_time_of_class =  DateTime.strptime(params[:schedule][:date_time_of_class], '%m/%e/%Y %I:%M %p')
			if @schedule.save
			redirect_to schedules_path, notice: "Great the meeting is set! You can view it in your schedule. Come back then and we'll connect you!"
			# NotificationMailer.schedule_confirmation(@schedule).deliver!
			end
		# end

	end

	def destroy
	end
end
