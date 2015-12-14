class ChargeSerializer < ActiveModel::Serializer
  attributes :id, :sale_id
  belongs_to :sale
end
