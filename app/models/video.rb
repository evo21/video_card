class Video < ActiveRecord::Base
  belongs_to :card

  # scope :complete, { where(:completed => true) }
end

# card.videos.complete