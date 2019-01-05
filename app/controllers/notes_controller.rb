class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]

  def create
    note = Note.new(note_params)
    authorize! :create, note
    note.user = current_user
    note.readers << current_user
    note.save!
    redirect_to '/'
  end

  def update
    @note.update(note_params)
    redirect_to '/'
  end

  def index
    @notes = Note.none
    if current_user
      @notes = current_user.readable
    end
  end

  def new
     render partial: 'form', locals: {note: Note.new}
  end

  def edit
  end


  def show
  end

  private

  def note_params
    params.require(:note).permit(:content,:visible_to)
  end
end
