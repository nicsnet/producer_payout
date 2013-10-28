require_relative '../../test_helper'

describe VideoView do

  before do
    VideoView.destroy_all
  end

  let(:range) {Date.new(2013, 8, 1)..Date.new(2013, 8, 31)}
  let(:view_in_range) do
    Factory.create :video_view, created_at: DateTime.new(2013, 8, 8, 12)
  end

  let(:view_out_of_range) do
    Factory.create :video_view, created_at: DateTime.new(2013, 1, 31, 12)
  end

  describe '.between' do
    it 'returns all video views for a given date range' do
      VideoView.between(range.first, range.last).must_equal [view_in_range]
    end

    it 'does not return videos out of range' do
      VideoView.between(range.first, range.last).wont_include view_out_of_range
    end
  end
end
