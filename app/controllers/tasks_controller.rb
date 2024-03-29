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
    @task = create_task.task
    authorize @task

    if create_task.success?
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    if update_task.success?
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    redirect_to tasks_path, notice: 'Task was successfully destroyed.' if destroy_task.success?
  end

  private
    
    def create_task
      @create_task ||= CreateTask.call(task_params: task_params)
    end

    def update_task
      @update_task ||= UpdateTask.call(task_params: task_params, task: @task)
    end

    def destroy_task
      @destroy_task ||= DestroyTask.call(task: @task)
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :deadline_at, :project_id, :status)
    end
end
