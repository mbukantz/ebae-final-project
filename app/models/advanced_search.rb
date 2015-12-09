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

  # private

  def find_listings
    # keywords, category_id, min_price, max_price
    # join items and listings
    search_base = Listing.joins(:item)
    search_hash = {
      :keywords => ["lower(items.name) like ?", "%#{keywords}%".downcase],
      :category_id => ["items.category_id = ?", category_id],
      # :min_price => ["starting_price >= ?", min_price],
      # :max_price => ["starting_price <= ?", max_price],
      :completed => ["listings.end_time < ?", Time.now] 
    }


    search_hash.each do |key, val| 
      if self.send(key)
        search_base = search_base.where(val[0], val[1])
      end
    end

    if !completed 
      search_base = search_base.where("listings.end_time > ?", Time.now)
    end
    # initial_search1 = search_base
    # initial_search2 = search_base
    if min_price
      min_base = search_base.where("starting_price >= ? AND current_price is NULL", min_price) 
      min_base2 = search_base.where("current_price >= ? AND current_price is not NULL", min_price)
      search_base_min = min_base | min_base2
    end

    if max_price
      max_base = search_base.where("starting_price <= ? AND current_price is NULL", max_price)
      max_base2 = search_base.where("current_price <= ? AND current_price is not NULL", max_price)
      search_base_max = max_base | max_base2
    end

    search_base = search_base_min & search_base_max

    binding.pry
    search_base

  end







    # Listing.joins(:item).where("lower(items.name) like ?", "%#{keywords}%".downcase).where("items.category_id = ?", "%#{category_id}%").send()

    # items = Item.order(:name)
    # listings = Listing.order(:starting_price)
    # itemsWithKeyword = items.where("name like ?", "%#{keywords}%") if keywords.present?
    # itemsWithCategory = items.where(category_id: category_id) if category_id.present?
    # listingsByMinPrice = listings.where("starting_price >= ?", min_price) if min_price.present?
    # listingsByMaxPrice = listings.where("starting_price <= ?", max_price) if max_price.present?

end
