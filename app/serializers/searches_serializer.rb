class SearchesSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :type, :file_name

  def id
    object.class.to_s.downcase + '|' + object.id.to_s
  end

  def type
    object.class.to_s.camelize
  end

end
