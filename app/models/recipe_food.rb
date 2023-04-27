class RecipeFood < ApplicationRecord

  #validations
  validates :quantity, presence: true
 


  belongs_to :food, class_name: 'Food'
  belongs_to :recipe, class_name: 'Recipe'
end
