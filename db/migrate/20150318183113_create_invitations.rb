class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :email
      t.text :plug

      t.timestamps null: false
    end
  end
end
