class TagsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @script = Script.find(params[:script_id])
    @command = @script.commands.find(params[:command_id])
    @tag = @command.tags.new
  end

  def create
    @script = Script.find(params[:script_id])
    @command = @script.commands.find(params[:command_id])
    @tag = @command.tags.new(params[:tag])

    respond_to do |format|
      if @tag.save
        format.html { redirect_to script_path(@script), notice: 'Tag was successfully created.' }
        format.json { render json: @tag, status: :created, location: @tag }
      else
        format.html { render action: "new" }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @script = Script.find(params[:script_id])
    @command = @script.commands.find(params[:command_id])
    @tag = @command.tags.find(params[:id])
  end

  def update
    @script = Script.find(params[:script_id])
    @command = @script.commands.find(params[:command_id])
    @tag = @command.tags.find(params[:id])

    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        format.html { redirect_to script_path(@script), notice: 'Tag was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @script = Script.find(params[:script_id])
    @command = @script.commands.find(params[:command_id])
    @tag = @command.tags.find(params[:id])
    @tag.delete

    respond_to do |format|
      format.html { redirect_to script_path(@script) }
      format.json { head :ok }
    end
  end
end
