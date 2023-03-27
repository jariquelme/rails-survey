class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :department, optional: true
  belongs_to :team, optional: true

  validates :alias, presence: true
end
