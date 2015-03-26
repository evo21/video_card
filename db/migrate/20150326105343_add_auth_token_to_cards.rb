class AddAuthTokenToCards < ActiveRecord::Migration
  def change
    add_column :cards, :auth_token, :string
  end
end
