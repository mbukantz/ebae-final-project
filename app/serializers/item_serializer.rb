class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :picture_url, :condition_id, :listing_id, :category_id, :picture_file_name, :picture_content_type, :picture_file_size, :picture_updated_at

end
