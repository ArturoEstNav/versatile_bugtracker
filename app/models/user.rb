class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :memos, through: :tickets
  has_many :events, through: :tickets

  validates :first_name, :last_name, :tier, presence: true
  validates :email, :employee_id, uniqueness: true, presence: true

  # user methods only to be accessed by sups
  # retrieve history of events
  # retrieve memo history
end
