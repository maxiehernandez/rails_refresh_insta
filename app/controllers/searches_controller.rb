class SearchesController < ApplicationController

  def index

    @posts = Post.includes(:comments).all

    search_query = params[:q].downcase
    render json: Post.search(@posts, params[:q].downcase)
    # render json: @posts.select { |post|
    #   if !post.file_name.nil?
    #     post.caption.downcase.include?(search_query) || post.file_name.downcase.include?(search_query)
    #   end
    # }

    # render json: StoreIndex.query(query_string: {fields: [:caption, :original_file_name, :file_name, :body], query: params[:q], default_operator: 'or'}).load.to_a, each_serializer: SearchesSerializer, root: "searches"
  end

end
