require_relative '../../test_helper'

describe ProducerPayout::ProducerPayout do

  before do
    Video.destroy_all
    VideoView.destroy_all
    Subscription.destroy_all
    Producer.destroy_all
    load 'db/seeds.rb'
  end
  let(:range) { Date.new(2013, 8, 1)..Date.new(2013, 8, 31) }

  let(:producer) { Producer.first }

  subject { ProducerPayout::ProducerPayout.new(producer, range)}

  describe '#calculate' do
    it 'calculates all revenues generated from video views for one producer and time period' do
      subject.calculate.to_f.must_equal 5.58
    end
  end
end
