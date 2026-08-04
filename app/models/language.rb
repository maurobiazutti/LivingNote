class Language < ApplicationRecord
  belongs_to :profile

  validates :name, presence: true
end
