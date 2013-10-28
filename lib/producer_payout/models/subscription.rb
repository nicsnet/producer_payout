class Subscription < ActiveRecord::Base
  has_many :videos, through: :video_views
  has_many :video_views

  scope :between, lambda {|start, finish|
    where{ (start_date >= start) & (end_date <= finish)}
  }

  def price_per_video(video_ids=[], amount)
    average_price = amount / video_ids.length
    hashify_and_sum_price_per_video(video_ids, average_price)
  end

  def hashify_and_sum_price_per_video(array, price)
   rows = array.zip( [price]*array.size)
   hash = rows.map{ |r| Hash[r[0].to_s => r[1]]}
   hash.inject(Hash.new(0)) {|memo, subhash| subhash.each {|prod, value| memo[prod] += value}; memo}
  end

  def price_for_duration(start, finish)
    duration = start - finish
    price * (duration / total_duration)
  end

  def total_duration
    start_date - end_date
  end
end
