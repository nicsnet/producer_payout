module ProducerPayout
  class ProducerPayout

    attr_reader :producer
    attr_reader :start_date
    attr_reader :end_date

    def initialize(producer, period)
      @producer = producer
      @start_date = period.first
      @end_date = period.last
    end

    def calculate
      sum = 0
      videos = producer.videos.with_views_between(start_date, end_date).uniq
      videos.each do |video|
        sum += video.calculate_price_for_subscriptions_in_period(start_date, end_date)
      end
      (sum * 0.25).round(2)
    end
  end
end
