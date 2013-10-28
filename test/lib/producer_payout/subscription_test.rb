require_relative '../../test_helper'

describe Subscription do

  before do
    Subscription.destroy_all
  end

  subject { Factory.create :subscription, price: 99.90}
  let(:range) {Date.new(2013, 3, 1)..Date.new(2013, 8, 31)}
  let(:subscription_in_range) do
    Factory.create :subscription, start_date: Date.new(2013, 4, 1), end_date: Date.new(2013, 8, 1)
  end

  let(:subscription_out_of_range) do
    Factory.create :subscription, start_date: Date.new(2013, 1, 1), end_date: Date.new(2013, 2, 28)
  end

  describe '.between' do
    it 'returns all subscriptions with durations in a given period' do
      Subscription.between(range.first, range.last).must_equal [subscription_in_range]
    end
    it 'does not return subscriptions out of range' do
      Subscription.between(range.first, range.last).wont_include subscription_out_of_range
    end
  end

  describe '#hashify_and_sum_price_per_video' do
    let(:array) {[1, 2, 5, 5, 5, 3] }
    let(:price) { 35.89 }

    it 'returns a hash with array values as hash keys, and amount as hash value and sums up the values of identical keys' do
      hash = {"1"=> 35.89, "2"=> 35.89, "5"=> 107.67, "3"=> 35.89 }
      subject.hashify_and_sum_price_per_video(array, price).must_equal hash
    end
  end

  describe '#price_per_video' do
    let(:array) {[1, 2, 5, 5, 5, 3] }
    let(:price) { 120.12 }

    it 'returns a hash with ids and an evenly distributed amount amongst its values' do
      hash = {"1"=> 20.02, "2"=> 20.02, "5"=> 60.06, "3"=> 20.02}
      subject.price_per_video(array, price).must_equal hash
    end
  end

  describe '#price_for_duration' do
    it 'returns a percentage of price for a given duration' do
      subject.price_for_duration(range.first, range.last).to_f.must_equal 50.22445054945055
    end
  end

  describe '#total_duration' do
    it 'should determine the total duration of a subscription' do
      subscription_in_range.total_duration.must_equal (-122/1)
    end
  end
end
