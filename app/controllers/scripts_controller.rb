class ScriptsController < ApplicationController
  def index
    @scripts = Script.all
  end

  def show
    @script = Script.find(params[:id])
    @commands = @script.commands.where("parent_id IS NULL").order("position")

    respond_to do |format|
      format.html
      format.xml { render :action => "show.xml.builder", :layout => false }
    end
  end

  def new
    @script = Script.new
  end

  def edit
    @script = Script.find(params[:id])
  end

  def update
    @script = Script.find(params[:id])

    respond_to do |format|
      if @script.update_attributes(params[:script])
        format.html { redirect_to scripts_path, notice: 'Script was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @script.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @script = Script.new(params[:script])

    respond_to do |format|
      if @script.save
        format.html { redirect_to scripts_path, notice: 'Script was successfully created.' }
        format.json { render json: @script, status: :created, location: @script }
      else
        format.html { render action: "new" }
        format.json { render json: @script.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @script = Script.find(params[:id])
    @script.delete

    respond_to do |format|
      format.html { redirect_to scripts_url }
      format.json { head :ok }
    end
  end
end

