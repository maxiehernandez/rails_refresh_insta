# class StoreIndex < Chewy::Index
#
#   define_type Post.includes(:comments) do
#    field :caption, :original_file_name, :file_name
#    field :comments do
#      field :body
#    end
#   end
#
#   define_type Comment.includes(:post) do
#    field :body
#    field :post do
#      field :caption, :original_file_name, :file_name
#    end
#   end
#
# end
