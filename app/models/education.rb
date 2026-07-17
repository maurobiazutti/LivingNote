class Education < ApplicationRecord
  belongs_to :profile

  validates :institution_name, :degree, :start_date, :end_date, presence: true
end
