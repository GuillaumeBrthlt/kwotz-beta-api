class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
	:jwt_authenticatable, :confirmable,
	jwt_revocation_strategy: JwtDenylist
  has_many :suppliers, dependent: :delete_all
  has_many :projects, dependent: :delete_all
  has_one :user_profile, dependent: :destroy

end
