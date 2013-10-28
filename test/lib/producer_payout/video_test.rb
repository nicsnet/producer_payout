require_relative '../../test_helper'

describe Video do

  before do
    Video.destroy_all
    VideoView.destroy_all
    Subscription.destroy_all
  end

  let(:range) {Date.new(2013, 8, 1)..Date.new(2013, 8, 31)}
  let(:view_in_range) do
    Factory.create :video_view, created_at: DateTime.new(2013, 8, 8, 12)
  end

  let(:view_out_of_range) do
    Factory.create :video_view, created_at: DateTime.new(2013, 1, 31, 12)
  end

  let(:year_subscription) do
    Factory.create :subscription, start_date: Date.new(2013, 1, 1),
    end_date: Date.new(2013, 12, 31), price: 179.40, video_views: [view_out_of_range]
  end

  let(:six_month_subscription) do
    Factory.create :subscription, start_date: Date.new(2013, 2, 15),
    end_date: Date.new(2013, 8, 14), price: 149.70, video_views: [view_in_range]
  end

  let(:video_in_range) do
    Factory.create :video, video_views: [view_in_range], subscriptions: [six_month_subscription]
  end

  let(:video_out_of_range) do
    Factory.create :video, video_views: [view_out_of_range], subscriptions: [year_subscription]
   end

  describe '.with_views_between' do
    it 'returns all videos with views in a given period' do
      Video.with_views_between(range.first, range.last).must_equal [video_in_range]
    end
    it 'does not return videos with views out of range' do
      Video.with_views_between(range.first, range.last).wont_include video_out_of_range
    end
  end

  describe '#calculate_price_for_subscriptions_in_period' do
    it 'returns the price for one video for all its subscriptions and views in a given period' do
      video_in_range.calculate_price_for_subscriptions_in_period(range.first, range.last).to_f.must_equal 24.95
    end

    it 'the price is zero if the video has no views in the given period' do
      video_out_of_range.calculate_price_for_subscriptions_in_period(range.first, range.last).must_equal 0
    end
  end
end
