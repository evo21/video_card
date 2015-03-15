class RemoveCaptionFromVideos < ActiveRecord::Migration
  def change
    remove_column :videos, :caption, :string
  end
end
