class AdvancedSearchSerializer < ActiveModel::Serializer
  attributes :id, :category_id, :min_price, :max_price, :completed
end
