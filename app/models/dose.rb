class Dose < ActiveRecord::Base
  validates :description, :cocktail_id, :ingredient_id, presence:true

  belongs_to :cocktail
  belongs_to :ingredient

end
