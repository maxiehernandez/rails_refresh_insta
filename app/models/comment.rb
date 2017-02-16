class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  # elasticsearch indexes
 update_index('store#comment') { self } # specifying index, type and back-reference
 # for updating after user save or destroy associations
 alias_attribute :description, :body

end
