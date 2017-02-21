class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

   def self.uploading(file)
    #  uploaded_io = file
    #  path = Rails.root.join('public', 'uploads', uploaded_io.original_filename)
    #  File.open(path, 'wb') do |file|
    #    file.write(uploaded_io.read)
    #  end
    #  return path

      s3 = Aws::S3::Resource.new
      bucket = s3.bucket(ENV['AWS_S3_BUCKET'])

      file_key = file.original_filename
      file_obj = bucket.object(file_key)
      aws_response = file_obj.upload_file(file.tempfile)

      if aws_response
        return file_key
      end

   end

  #  def aws_download(file)
  #    s3 = Aws::S3::Resource.new
  #    bucket = s3.bucket(ENV['AWS_S3_BUCKET'])
   #
  #    file_key = file.original_filename
   #
  #    File.open(self.file_name, 'wb') do |file|
  #      reap = s3.get_object({ bucket:'bucket', key:'file_key' }, target: '/upload')
  #    end
  #  end

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
