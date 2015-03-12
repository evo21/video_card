class AddVideoUuidToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :video_uuid, :string
  end
end
