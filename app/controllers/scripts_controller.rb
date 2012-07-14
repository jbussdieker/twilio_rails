class ScriptsController < ApplicationController
  def index
    @scripts = Script.all
  end

  def show
    @script = Script.find(params[:id])

    respond_to do |format|
      format.html
      format.xml { render :action => "show.xml.builder", :layout => false }
    end
  end
end
