class Chapter < ApplicationRecord
	acts_as_paranoid
	validates_presence_of :name, :subject_id
	validates_numericality_of :subject_id
	belongs_to :subject
	has_many :schedules, dependent: :destroy
end
