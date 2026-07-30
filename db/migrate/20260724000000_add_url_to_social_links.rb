class AddUrlToSocialLinks < ActiveRecord::Migration[8.1]
  def change
    add_column :social_links, :url, :string
  end
end
