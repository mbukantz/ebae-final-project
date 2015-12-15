# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  name         :string
#  description  :string
#  picture_url  :string
#  condition_id :integer
#  listing_id   :integer
#  category_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Item < ActiveRecord::Base
  belongs_to :category
  belongs_to :condition
  belongs_to :listing
  has_many :pictures
  has_many :images, through: :pictures

  accepts_nested_attributes_for :pictures, :images

  validates :name, presence: true
  validates :description, presence: true
  validates :condition_id, presence: true


  def self.all_by_category?(category)
    Item.where("category_id = ?", category.id)
  end

  # def picture_to_use
  #   self.picture.url == "/pictures/original/missing.png" ? self.picture_url : self.picture.url(:thumb)
  # end

  def picture_to_use
    if self.pictures.empty?
      self.picture_url
    else
      self.pictures.first.image.url(:thumb)
    end
  end

end
