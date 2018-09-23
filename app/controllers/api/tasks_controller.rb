class Api::TasksController < ApplicationController
  protect_from_forgery with: :null_session
  # GET /tasks.json
  def index
    @tasks = Task.all.order('created_at DESC')
  end

  #POST
  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created
      flash[:notice] = "タスクを追加しました"
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  #DELETE
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def task_params
    params.fetch(:task, {}).permit(:name)
  end
end