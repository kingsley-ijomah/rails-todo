class ArchivesController < ApplicationController
  def index
    @archives = Task.where(status: Task.statuses[:archived])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to archives_path, notice: 'Successfully deleted an archive'
  end
end