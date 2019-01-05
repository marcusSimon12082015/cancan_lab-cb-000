class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Note, user_id: user.id
  end
end
