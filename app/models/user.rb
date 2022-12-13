class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
	:jwt_authenticatable, :confirmable,
	jwt_revocation_strategy: JwtDenylist
  has_one :user_profile, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :suppliers, dependent: :destroy
end
