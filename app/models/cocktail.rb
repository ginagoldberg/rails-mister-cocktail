class Cocktail < ActiveRecord::Base
  validates :name,  presence: true, uniqueness: true, dependent: :destroy

  has_many :doses
  has_many :ingredients
end
