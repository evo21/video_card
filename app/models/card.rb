class Card < ActiveRecord::Base
  has_many :videos
  has_many :invitations

  validates :slug, presence:true, uniqueness: true
  validates :title, presence: true
  validates :category, presence: true

  CARD_CATEGORIES = ['basic', 'birthday', 'congratulations', 'wedding', 'anniversary', 'sympathy', 'thank_you']

end
