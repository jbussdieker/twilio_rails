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

  def new
    @script = Script.new
  end

  def create
    @script = Script.create(params[:script])
    redirect_to scripts_path
  end
end
