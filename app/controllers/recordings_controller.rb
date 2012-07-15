class RecordingsController < ApplicationController
  def index
    @recordings = Recording.all
  end

  def destroy
    @recording = Recording.find(params[:id])
    @recording.delete

    respond_to do |format|
      format.html { redirect_to recordings_url }
      format.json { head :ok }
    end
  end
end
