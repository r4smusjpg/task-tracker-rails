class TasksController < ApplicationController
  before_action :authenticate_current_user!
  before_action :set_task, only: %i[show edit update destroy]
  before_action -> { authorize @task }, only: %i[show edit update destroy]
  before_action -> { authorize Task }, only: %i[index new]

  def index
    @tasks = Task.all
  end

  def show
    @comment = Comment.new
    @comments = @task.comments
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    authorize @task

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'Task was successfully destroyed.'
  end

  private
  
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :deadline_at, :project_id, :status)
    end
end
