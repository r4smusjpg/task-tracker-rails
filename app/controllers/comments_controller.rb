class CommentsController < ApplicationController
  before_action :authenticate_current_user!
  before_action :set_comment, only: %i[edit update destroy]
  before_action -> { authorize @comment }, only: %i[edit update destroy]

  def create
    @comment = Comment.new(comment_params)
    authorize @comment

    if @comment.save
      redirect_to @comment.task, notice: 'Comment was successfully created.'
    else
      redirect_to @comment.task, alert: 'Comment was not created.'
    end
  end
  
  def edit
    @task = @comment.task
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment.task, notice: 'Comment was successfully updated.'
    else
      render :edit, alert: 'Comment was not updated.'
    end
  end

  def destroy
    if @comment.delete
      redirect_to @comment.task, notice: 'Comment was successfully deleted.'
    else
      redirect_to @comment.task, alert: 'Comment was not deleted.'
    end
  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content, :task_id, :user_id).merge(user_id: current_user.id, task_id: params[:task_id])
    end
end
