class AddEmailToCards < ActiveRecord::Migration
  def change
    add_column :cards, :email, :string
  end
end
