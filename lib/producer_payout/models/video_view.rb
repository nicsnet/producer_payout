class VideoView < ActiveRecord::Base
  belongs_to :video
  belongs_to :subscription

  scope :between, lambda {|start, finish|
    where{(created_at >= start) & (created_at <= finish)}
  }
end
