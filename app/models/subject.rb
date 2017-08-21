class Subject < ApplicationRecord
	validates_presence_of :name
	has_many :chapters

	has_many :educator_subjects, dependent: :destroy
	has_many :educators, through: :educator_subjects
end
