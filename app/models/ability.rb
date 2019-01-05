class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Note, user_id: user.id
    can :update, Note, user_id: user.id
    can :manage, Note if current_user
    can :read, Note do |note|
      !Viewer.find_by(user_id: user.id, note_id: note.id).nil? && note.user_id != user.id
    end
    cannot :read, Note do |note|
      Viewer.where(user_id: user.id, note_id: note.id) == [] && note.user_id != user.id
    end
  end
end
