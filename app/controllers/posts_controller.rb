class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]


  def index
    if params[:page]
      @posts = Post.page(params[:page][:number]).per(params[:page][:size])
    else
      @posts = Post.includes(:comments).all
    end

    sorted_post = @posts.order('posts.created_at DESC')
    render json: sorted_post, meta: pagination_dict(@posts)
  end


  def show
    # sorted_comments = @post.sort_comments
    render json: @post #sorted_comments
  end


  def create
    path = nil
    original_filename = nil
    content_type = nil
    if params["files"]
      data = JSON.parse(params[:data])["attributes"]
      file = params[:files][0]
      path = Post.uploading(file)
      original_filename = file.original_filename
      content_type = file.content_type
    else
      data = params[:data][:attributes]
    end

    user = User.find(1)#params[:data][:relationships][:user][:data][:id])

    new_post = Post.new(
      caption:            data["caption"],
      file_name:          data["file-name"],
      image_url:          data["image-url"],
      original_file_name: original_filename,
      file_content_type:  content_type,
      file:               path,
      user_id:            user.id
    )

    new_post.save!
    render json: new_post
  end

  def update
    if @post.update!(post_params)
      render json: @post, status: 200
    else
      render json: @post.errors, status: 500
    end
  end

  def destroy
    @post.destroy!
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

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
      new_params.permit(:caption, :image_url, :original_file_name, :file_name, :file_content_type, :file_updated_at, :file)
    end
end
