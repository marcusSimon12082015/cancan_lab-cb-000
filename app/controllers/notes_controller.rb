class NotesController < ApplicationController
  load_and_authorize_resource

  def create
    user = User.find_by(session[:user_id])
    @note.user = user unless user.nil?
    @note.readers << user unless user.nil?
    byebug
    redirect_to '/'
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
