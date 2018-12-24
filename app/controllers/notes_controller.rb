class NotesController < ApplicationController
  def create
    @bucket = Bucket.find(params[:bucket_id])
    @note = @bucket.notes.create(note_params)
    redirect_to bucket_path(@bucket)
  end

  def destroy
    @bucket = Bucket.find(params[:bucket_id])
    @note = @bucket.notes.find(params[:id])
    @note.destroy
    redirect_to bucket_path(@bucket)
  end

  private

  def note_params
    params.require(:note).permit(:name, :body)
  end
end
