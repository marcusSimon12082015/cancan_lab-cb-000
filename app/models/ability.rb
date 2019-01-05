class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Note, user_id: user.id
    cannot :read, Note do |note|
      Viewer.where(user_id: user.id, note_id: note.id) == []
    end
  end
end
