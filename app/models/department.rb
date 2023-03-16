class Department < ApplicationRecord
  validates :name, presence: true

  has_many :teams, dependent: :destroy, inverse_of: :department
  accepts_nested_attributes_for :teams, allow_destroy: true, reject_if: :all_blank
end
