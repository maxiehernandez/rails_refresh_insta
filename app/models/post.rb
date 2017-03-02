class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

   def self.uploading(file)
    #  uploaded_io = file
    #  path = Rails.root.join('public', 'uploads', uploaded_io.original_filename)
    #  File.open(path, 'wb') do |file|
    #    file.write(uploaded_io.read)
    #  end
    #  return path
      file_key = file.original_filename
      s3 = Aws::S3::Resource.new()
      file_obj = s3.bucket(ENV['AWS_S3_BUCKET']).object(file_key)
      aws_response = file_obj.upload_file(file.tempfile, acl: 'public-read')

      if aws_response
        return file_obj.public_url
      end

   end


   def self.search(posts, query)
     posts.select { |post|
       if !post.file_name.nil?
         post.caption.downcase.include?(query) || post.file_name.downcase.include?(query)
       end
     }
   end




  # elasticsearch indexes
 # update_index('store#post') { self } # specifying index, type and back-reference
 # # for updating after user save or destroy associations
 # alias_attribute :title, :file_name
 # alias_attribute :description, :caption

end
