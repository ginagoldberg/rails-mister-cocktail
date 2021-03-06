class Ingredient < ActiveRecord::Base
  validates :name, presence:true, uniqueness:true

  belongs_to :cocktail
  has_many :doses
end
