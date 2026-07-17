class Resume < ApplicationRecord
  belongs_to :profile

  validates :title, :objective, presence: true
  validate :profile_can_have_only_three_resumes

  private

  def profile_can_have_only_three_resumes
    return unless profile

    if profile.resumes.where.not(id: id).count >= 3
      errors.add(:base, "Você pode criar no máximo 3 currículos.")
    end
  end
end
