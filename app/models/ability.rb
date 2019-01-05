class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Note, do |note|
      user_id: user.id
    end
  end
end
