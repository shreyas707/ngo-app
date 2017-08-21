class Learner < ApplicationRecord
	belongs_to :user
	has_many :schedules, dependent: :destroy
	validates_presence_of :user_id, :grade, :start_time, :end_time
	validates_numericality_of :user_id, :grade
	validates_numericality_of :mentor_id, allow_nil:true
	validates_uniqueness_of :user_id
end
