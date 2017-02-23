class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]

  def show
    render json: Comment.find(params[:id].to_i)
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = 1 #params[:data][:relationships][:user][:data][:id]
    if @comment.save!
      render json: @comment, status: 200
    else
      render json: @comment.errors, status: 500
    end
  end

  def destroy
    @comment.destroy
  end

  private
    def set_comment
      @comment = Comment.find(params[:comment].to_i)
    end

    def set_post
      @post = Post.find(params[:data][:relationships][:post][:data][:id])
    end

    def comment_params
      params.require(:data).require(:attributes).permit(:body)
    end
end
