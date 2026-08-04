class Education < ApplicationRecord
  belongs_to :profile

  validates :institution, :degree, :start_date, presence: true
end
