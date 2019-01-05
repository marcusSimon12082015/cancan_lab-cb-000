class NotesController < ApplicationController
  load_and_authorize_resource

  def create
    byebug
  end

  def show

  end

  def destroy
  end

  def update
  end

  def new
  end

  def edit
  end

  private

  def note_params
    params.require(:note).permit(:content,:visible_to)
  end
end
