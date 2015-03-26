class Video < ActiveRecord::Base
  belongs_to :card

  validates :video_uuid, presence: true
  # scope :complete, { where(:completed => true) }

  before_create :generate_auth_token

  CARD_CATEGORIES = ['birthday', 'congratulations', 'wedding', 'anniversary', 'sympathy', 'thank_you', 'generic']


  def generate_auth_token
    # in a world where millions of people will use this, we would 
    # check to make sure the token is not duplicated.  We are not in that world.
    self.auth_token = SecureRandom.hex
  end
end

