# == Schema Information
#
# Table name: advanced_searches
#
#  id          :integer          not null, primary key
#  keywords    :string
#  category_id :integer
#  min_price   :integer
#  max_price   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AdvancedSearch < ActiveRecord::Base

  def listings
    @listings ||= find_listings
  end

  private

  def find_listings
    <<-SQL SELECT "item"
    FROM "listings" 
    JOINS "item"
    ON "listing.item.id" = "item.listing_id"
    SQL
    # items = Item.order(:name)
    # listings = Listing.order(:starting_price)
    # itemsWithKeyword = items.where("name like ?", "%#{keywords}%") if keywords.present?
    # itemsWithCategory = items.where(category_id: category_id) if category_id.present?
    # listingsByMinPrice = listings.where("starting_price >= ?", min_price) if min_price.present?
    # listingsByMaxPrice = listings.where("starting_price <= ?", max_price) if max_price.present?
  end

end
