class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new #  guest user (not logged in)
    # all users authenticated or not can view public recipes
    can :read, Recipe, public: true
    # user can perform crud operation his/her own Recipe
    can(:manage, Food, user:)
    # user can perform crud operation
    can(:manage, Recipe, user:)
  end
end
