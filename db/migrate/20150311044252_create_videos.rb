class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :card_id
      t.string :caption

      t.timestamps null: false
    end
  end
end
