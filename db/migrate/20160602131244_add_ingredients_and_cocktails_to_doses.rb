class AddIngredientsAndCocktailsToDoses < ActiveRecord::Migration
  def change
    add_reference :doses, :ingredient, index: true, foreign_key: true
    add_reference :doses, :cocktail, index: true, foreign_key: true
  end
end
