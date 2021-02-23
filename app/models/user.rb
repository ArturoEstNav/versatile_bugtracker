class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :validatable, :registerable
  has_many :tickets, through: :tickets_users
  has_many :user_events
  has_many :events, as: :eventable


  validates :first_name, :last_name, presence: true
  validates :email, :employee_number, uniqueness: true, presence: true
end
