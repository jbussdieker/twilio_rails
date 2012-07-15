class CommandsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @script = Script.find(params[:script_id])
    @command = @script.commands.new
    @command.parent_id = params[:parent_id]
  end

  def create
    @script = Script.find(params[:script_id])
    @command = @script.commands.new(params[:command])

    respond_to do |format|
      if @command.save
        format.html { redirect_to script_path(@script), notice: 'Command was successfully created.' }
        format.json { render json: @command, status: :created, location: @command }
      else
        format.html { render action: "new" }
        format.json { render json: @command.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @script = Script.find(params[:script_id])
    @command = Command.find(params[:id])
  end

  def update
    @script = Script.find(params[:script_id])
    @command = Command.find(params[:id])

    respond_to do |format|
      if @command.update_attributes(params[:command])
        format.html { redirect_to script_path(@script), notice: 'Command was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @command.errors, status: :unprocessable_entity }
      end
    end
  end

  def move
    @script = Script.find(params[:script_id])
    @command = @script.commands.find(params[:id])
    @command.send(params[:direction])
    redirect_to script_path(@script)
  end

  def destroy
    @command = Command.find(params[:id])
    @command.delete
    redirect_to script_path(params[:script_id])
  end
end
