class SearchesController < ApplicationController

  def index
    @posts = Post.includes(:comments).all
    render json:@posts.select { |post| post.caption.include? params[:q]}
    # @posts.filter((i)=>{
    #   i.title.includes('abc')
    #   })

    # render json: StoreIndex.query(query_string: {fields: [:caption, :original_file_name, :file_name, :body], query: params[:q], default_operator: 'or'}).load.to_a, each_serializer: SearchesSerializer, root: "searches"
  end

end
