# == Schema Information
#
# Table name: recently_viewed_listings
#
#  id         :integer          not null, primary key
#  listing_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RecentlyViewedListing < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user
end
