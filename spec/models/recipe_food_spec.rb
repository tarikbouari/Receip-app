require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  subject do
    RecipeFood.new(
      food_id: 1,
      recipe_id: 1,
      quantity: 10
    )
  end

  before { subject.save }

  it 'food_id should be present' do
    subject.food_id = nil
    expect(subject).not_to be_valid
  end

  it 'recipe_id should be present' do
    subject.recipe_id = nil
    expect(subject).not_to be_valid
  end

  it 'quantity should be present' do
    subject.quantity = nil
    expect(subject).not_to be_valid
  end
end
