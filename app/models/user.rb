class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :investments
  has_many :coins, through: :investments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
