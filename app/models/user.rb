class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :role
  belongs_to :organization
  has_one :learner, dependent: :destroy
  has_one :educator, dependent: :destroy
  
  validates_presence_of :name, :email, :role_id, :password
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
