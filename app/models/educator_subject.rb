class EducatorSubject < ApplicationRecord
	belongs_to :educator
	belongs_to :subject
end
