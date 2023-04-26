class RecipeFood < ApplicationRecord
  belongs_to :food, class_name: 'Food'
  belongs_to :recipe, class_name: 'Recipe'
end
