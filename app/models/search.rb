class Search< ActiveRecord::Base
  def self.for(listing)
     Listing.joins(:item).where("lower(items.name) like ?", "%#{listing}%".downcase)
  end
end
