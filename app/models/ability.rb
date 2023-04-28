class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new #  guest user (not logged in)
        can :read, Recipe, public :true # all users authenticated or not can view public recipes
        can (:manage, Food, user: user) # user can perform crud operation his/her own Recipe
        can (:manage, Recipe, user: user) # user can perform crud operation

  end
end
