class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tickets

  validates :first_name, :last_name, presence: true
  validates :email, :employee_number, uniqueness: true, presence: true
end
