class Subscription < ActiveRecord::Base
  has_many :video_views
end
