class TasksController < ApplicationController
  def index
    @todos = Task.where(status: :todo)
    @done = Task.where(status: :done)
  end
  
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(strong_params)

    if @task.save
      redirect_to tasks_path, notice: 'Successfully created task'
    else
      flash[:alert] = 'There was a problem saving task'
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(strong_params)
      redirect_to tasks_path, notice: 'Successfully updated task'
    else
      flash[:alert] = 'There was a problem updating task'
      render 'edit'
    end
  end

  def done
    @task = Task.find(params[:id])
    @task.update_column(:status, params[:status])
    redirect_to tasks_path, notice: 'Successfully marked as done'
  end

  def archive
    @task = Task.find(params[:id])
    @task.update_column(:status, params[:status])
    redirect_to tasks_path, notice: 'Successfully archived task'
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: 'Successfully deleted task'
  end

  private

  def strong_params
    params.require(:task).permit(:name, :status)
  end
end