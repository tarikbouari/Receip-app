class RecipeFood < ApplicationRecord
  # validations
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :food, uniqueness: { scope: :recipe, message: 'already exists in this recipe' }

  belongs_to :food, class_name: 'Food'
  belongs_to :recipe, class_name: 'Recipe'
end
