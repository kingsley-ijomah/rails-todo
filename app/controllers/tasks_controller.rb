class TasksController < ApplicationController
  def index
  end
  
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(strong_params)

    if @task.save
      redirect_to tasks_path, notice: 'Successfully created task'
    else

    end
  end

  private

  def strong_params
    params.require(:task).permit(:name, :status)
  end
end