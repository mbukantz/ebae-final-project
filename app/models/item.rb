# == Schema Information
#
# Table name: items
#
#  id                   :integer          not null, primary key
#  name                 :string
#  description          :string
#  picture_url          :string
#  condition_id         :integer
#  listing_id           :integer
#  category_id          :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

class Item < ActiveRecord::Base
  belongs_to :category
  belongs_to :condition
  belongs_to :listing

  validates :name, presence: true
  validates :description, presence: true
  validates :condition_id, presence: true

  # has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  has_attached_file :picture, styles: { medium: "500x500>", thumb: "200x200>" }

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

  def self.all_by_category?(category)
    Item.where("category_id = ?", category.id)
  end

  def picture_to_use
    self.picture.url == "/pictures/original/missing.png" ? self.picture_url : self.picture.url(:medium)
  end

end
