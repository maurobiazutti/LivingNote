class Skill < ApplicationRecord
  belongs_to :profile

  validates :name, presence: true
end
