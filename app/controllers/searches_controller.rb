class SearchesController < ApplicationController

  def index
    render json: StoreIndex.query(query_string: {fields: [:caption, :original_file_name, :file_name, :body], query: params[:q], default_operator: 'or'}).load.to_a, each_serializer: SearchesSerializer, root: "searches"
  end

end
