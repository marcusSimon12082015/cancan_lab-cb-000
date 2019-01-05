class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Note, user_id: user.id
    cannot :read, Note do |note|
      
    end 
  end
end
