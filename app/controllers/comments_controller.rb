class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :destroy]

  def show
    render json: @comment
  end

  def create
    @comment = @post.comments.build(comment_params)

    if @comment.save!
      render :show, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
