class Team < ApplicationRecord
  belongs_to :department

  has_many :survey_responses, dependent: :nullify, inverse_of: :team
  validates :name, presence: true
end
