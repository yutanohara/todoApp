class Api::TasksController < ApplicationController

  # GET /index.json
  def index
    @tasks = Task.all.order('created_at DESC')
  end

  #POST
  def create
    @task = Task.new(task_params)

    # @taskにrenderするとは、showにrenderするということ？
    # respondがjsonの時だけだったら、わざわざformatにする必要なし？
    respond_to do |format|
      if @task.save
        format.json { render json: @task, status: :created}
      else
        format.json { render json: @task.errors, status: :unprocessable_entity}
      end
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