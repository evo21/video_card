class AddAuthTokenToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :auth_token, :string
  end
end
