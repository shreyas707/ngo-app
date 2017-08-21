class Organization < ApplicationRecord
	validates_presence_of :name, :country, :state
	has_many :users, dependent: :destroy
end
