class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Note, do |note|
      user_id: user.id,
      !Viewer.find_by(user_id: user.id, note_id: note.id).nil?
    end 
    cannot :read, Note do |note|
      Viewer.where(user_id: user.id, note_id: note.id) == []
    end
  end
end
