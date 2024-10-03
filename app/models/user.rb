class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: { receptionist: 'receptionist', doctor: 'doctor' }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
