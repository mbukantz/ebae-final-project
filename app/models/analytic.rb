class Analytic < ActiveRecord::Base

  def highest_sale_price
    biggest_sale = Sale.order(price: :desc).first
  end

  def auctions_by_category
    category_count = Item.group(:category_id).count
     # => {1=>1, 4=>4, 5=>3, 7=>2} 
    category_count_with_names = Category.all.each_with_object({}) do | category_obj, category_count_hash|
      if category_count[category_obj.id]
        category_count_hash[category_obj.name] = category_count[category_obj.id]
      end
    end
    category_count_with_names.sort_by{|k, v| v}.reverse
  end


end
