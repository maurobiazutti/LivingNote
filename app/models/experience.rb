class Experience < ApplicationRecord
  belongs_to :profile

  validates :company, :position, :start_date, presence: true
end
