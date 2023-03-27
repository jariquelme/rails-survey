class SurveyResponse < ApplicationRecord
  belongs_to :user
  belongs_to :team, optional: true
  belongs_to :department

  validates :date, presence: true, uniqueness: { scope: :user_id, message: "should happen once per day" }
  validates_comparison_of :date, less_than_or_equal_to: Date.today

  validates :response, presence: true
  validates :department, presence: true

end
