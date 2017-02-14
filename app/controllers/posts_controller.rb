class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    render json: Post.includes(:comments).all
  end

  def show
    render json: @post
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.build(post_params)


    # @post = Post.new(post_params)

    if @post.save!
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    if @post.update!(post_params)
      render json: @post, status: 200
    else
      render json: @post.errors, status: 500
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:user_id])

    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      new_hash={}
      if params[:data]&&params[:data][:attributes]
        post_data=params[:data][:attributes]
      else
        post_data=params[:post]
      end

      post_data.each do |key,value|
        new_hash[key.gsub("-","_")]=value
      end

      new_params=ActionController::Parameters.new(new_hash)
      new_params.permit(:caption, :image_url, :original_file_name, :file_name, :file_content_type, :file_updated_at, :user_id)
    end
end
