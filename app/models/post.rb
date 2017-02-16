class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  # elasticsearch indexes
 update_index('store#post') { self } # specifying index, type and back-reference
 # for updating after user save or destroy associations
end
