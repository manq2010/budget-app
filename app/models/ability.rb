class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :manage, Expense, author_id: user.id
      can :manage, Group, user_id: user.id
    end
  end
end
