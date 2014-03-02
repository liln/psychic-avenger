class CommentsController < ApplicationController
  before_filter :load_commentable
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create
    @comment = @commentable.comments.new(comment_params)
    authorize @comment

    @comment.author = current_user.name
    @comment.author_email = current_user.email

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable, notice: 'Comment was submitted for approval.' }
        format.json { render action: 'show', status: :created, location: @commentable }
      else
        format.html { render action: 'new' }
        format.json { render json: @commentable.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    authorize @comment
    @comment.approved = true

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable, notice: 'Comment approved.' }
        format.json { render action: 'show', status: :created, location: @commentable }
      else
        format.html { redirect_to @commentable, notice: 'Error no changes made.' }
        format.json { render json: @commentable.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @comment

    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @commentable }
      format.json { head :no_content }
    end
  end

  private
    def load_commentable
      @resource, id = request.path.split('/')[2,3]
      @commentable = @resource.singularize.classify.constantize.find(id)
                      # same as Post.find(id) or Project.find(id)
    end

    def set_comment
      @comment = @commentable.comments.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(*policy(@comment || Comment).permitted_attributes)
    end
end
