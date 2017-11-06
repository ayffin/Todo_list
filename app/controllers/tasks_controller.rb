class TasksController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.create(task_params)
    redirect_to @list
  end
  def destroy
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    if @task.destroy
      flash[:success] = "tasks was destroyed successfully"
    else
      flash.now[:alert] = 'there was error deleting this item'
    end
    redirect_to @list
  end

  private
  def task_params
    params.require(:task).permit(:content)
  end
end
