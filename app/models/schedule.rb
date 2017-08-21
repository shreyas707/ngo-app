class Schedule < ApplicationRecord
	belongs_to :chapter
	belongs_to :learner
	belongs_to :educator, optional: true
	validates_presence_of :learner_id, :chapter_id
	validates_numericality_of :learner_id, :chapter_id
end
