class AddThumbnailsToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :thumb, :string
    add_column :videos, :small_thumb, :string
  end
end
