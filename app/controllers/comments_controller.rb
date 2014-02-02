class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(post_params)
    # authorize @comment

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was submitted for approval.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    @comment.approved = true

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment approved.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { redirect_to @post, notice: 'Error no changes made.' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # authorize @comment

    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @post }
      format.json { head :no_content }
    end
  end

  private
    def set_comment
      @post = Post.find(params[:post_id])
      @comment = Comment.find(params[:id])
    end

    def post_params
      params.require(:comment).permit(*policy(@comment || Comment).permitted_attributes)
    end
end
