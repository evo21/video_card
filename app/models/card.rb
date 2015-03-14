class Card < ActiveRecord::Base
  has_many :videos

  validates :slug, presence:true, uniqueness: true

  # def to_param
  #   self.slug.downcase.gsub(" ", "-")
  # end
end
