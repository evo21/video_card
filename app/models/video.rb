class Video < ActiveRecord::Base
  belongs_to :card

  validates :video_uuid, presence: true
  # scope :complete, { where(:completed => true) }
end

