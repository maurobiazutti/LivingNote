require "test_helper"

class ProfileTest < ActiveSupport::TestCase
  test "accepts nested social links" do
    user = User.create!(email: "test@example.com", password: "123456")
    profile = user.build_profile(full_name: "Test", cpf: "12345678909")

    profile.assign_attributes(
      social_links_attributes: [
        { platform: "GitHub", url: "https://github.com/test" },
        { platform: "LinkedIn", url: "https://linkedin.com/in/test" }
      ]
    )

    assert profile.valid?
    assert_equal 2, profile.social_links.size
  end
end
