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

  def find_listings

    results = initial_query(self)

    if !self.completed 
      results = active_listings_only(results)
    end
   
    if self.min_price
      min_price_results = refine_by_min_price(results)
    end

    if self.max_price
      max_price_results = refine_by_max_price(results)
    end

    if min_price_results && max_price_results
      results = min_price_results & max_price_results
    elsif min_price_results
      results = min_price_results
    elsif max_price_results
      results = max_price_results
    end

    results

  end


  def initial_query(search_terms)
    results = Listing.joins(:item)
    search_hash.each do |key, val| 
      if self.send(key)
        results = results.where(val[0], val[1])
      end
    end
    results
  end

  def search_hash
    {
      :keywords => ["lower(items.name) like ?", "%#{self.keywords}%".downcase],
      :category_id => ["items.category_id = ?", self.category_id],
      :completed => ["listings.end_time < ?", Time.now] 
    }
  end

  def active_listings_only(results)
    results = results.where("listings.end_time > ?", Time.now)
  end

  def refine_by_min_price(results)
    min_base = results.where("starting_price >= ? AND current_price is NULL", self.min_price) 
    min_base2 = results.where("current_price >= ? AND current_price is not NULL", self.min_price)
    min_base | min_base2
  end

  def refine_by_max_price(results)
    max_base = results.where("starting_price <= ? AND current_price is NULL", self.max_price)
    max_base2 = results.where("current_price <= ? AND current_price is not NULL", self.max_price)
    max_base | max_base2
  end



end
