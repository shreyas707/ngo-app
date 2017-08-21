class Educator < ApplicationRecord
	validates_presence_of :user_id, :certificate_required, :weekly_goal
	validates_numericality_of :user_id, :weekly_goal
	validates_uniqueness_of :user_id
	belongs_to :user
	has_many :schedules, dependent: :destroy
	has_many :educator_subjects, dependent: :destroy
    has_many :subjects, through: :educator_subjects
    def requests
    	chapters = Chapter.where(subject_id: self.subject_ids).pluck(:id)
    	return Schedule.where(chapter_id: chapters).where('confirmed = ?', false)
   	end  
end
