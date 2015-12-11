# == Schema Information
#
# Table name: pictures
#
#  id                 :integer          not null, primary key
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  item_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Picture < ActiveRecord::Base

  belongs_to :item
  # has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  has_attached_file :image, styles: { medium: "500x500>", thumb: "200x200>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


end
