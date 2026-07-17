class Experience < ApplicationRecord
  belongs_to :profile

  validates :company_name, :start_date, :end_date, :description, presence: true
end
