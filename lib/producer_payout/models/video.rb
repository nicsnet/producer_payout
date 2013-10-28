class Video < ActiveRecord::Base
  has_many :subscriptions, -> { uniq }, through: :video_views
  has_many :video_views
  belongs_to :producer

  scope :with_views_between, lambda {|start_date, end_date|
    joins{video_views}.where{(video_views.created_at >= start_date) & (video_views.created_at <= end_date)}
  }

  def calculate_price_for_subscriptions_in_period(start_date, end_date)
   sum = 0
   subscriptions.each do |subscription|
     price = subscription.price_for_duration(start_date, end_date)
     video_ids = subscription.video_views.between(start_date, end_date).map(&:video_id)
     sum += subscription.price_per_video(video_ids, price )[id.to_s]
   end
   sum
  end
end

