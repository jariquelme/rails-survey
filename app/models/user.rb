class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :registerable, :recoverable, :rememberable, :validatable,
  devise :database_authenticatable,
        :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :survey_responses
end
