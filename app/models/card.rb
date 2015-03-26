class Card < ActiveRecord::Base
  has_many :videos
  has_many :invitations

  validates :slug, presence:true, uniqueness: true
  validates :title, presence: true
  validates :email, presence: true
  validates :category, presence: true

  before_create :generate_auth_token

  CARD_CATEGORIES = ['birthday', 'congratulations', 'wedding', 'anniversary', 'sympathy', 'thank_you', 'generic']

  def generate_auth_token
    # in a world where millions of people will use this, we would 
    # check to make sure the token is not duplicated.  We are not in that world.
    self.auth_token = SecureRandom.hex
  end


end
