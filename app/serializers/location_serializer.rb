class LocationSerializer < ActiveModel::Serializer
  attributes :id, :street, :city, :state, :zip, :label, :user_id
end
