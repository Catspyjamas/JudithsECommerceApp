class Ability
  include CanCan::Ability

  def initialize(user)
    user ||=User.new # guest user (not logged in)
    can :manage, User, id: user.id
    can :manage, Comment, user_id: user.id
    if user.admin?  # additional permissions for administrators
      can :manage, Comment
    end
  end
end
