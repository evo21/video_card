class Card < ActiveRecord::Base
  has_many :videos
  has_many :invitations

  validates :slug, presence:true, uniqueness: true



  CARD_CATEGORIES = ['birthday', 'congratulations', 'wedding', 'sympathy', 'thanks']

  # def to_param
  #   self.slug.downcase.gsub(" ", "-")
  # end
end
