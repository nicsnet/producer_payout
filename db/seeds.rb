Subscription.create(
  user_id: 1, start_date: Date.new(2013, 1, 1),
  end_date: Date.new(2013, 12, 31), price: 179.40
)

Subscription.create(
  user_id: 2, start_date: Date.new(2013, 2, 15),
  end_date: Date.new(2013, 8, 14), price: 149.70
)

Subscription.create(
  user_id: 3, start_date: Date.new(2013, 6, 23),
  end_date: Date.new(2013, 7, 22), price: 99.95
)

Subscription.create(
  user_id: 3, start_date: Date.new(2013, 8, 11),
  end_date: Date.new(2013, 9, 10), price: 99.95
)

VideoView.create(
  user_id: 1, subscription_id: 1, video_id: 1,
  created_at: DateTime.new( 2013, 1, 10, 12)
)

VideoView.create(
  user_id: 3, subscription_id: 3, video_id: 4,
  created_at: DateTime.new( 2013, 7, 11, 12)
)
VideoView.create(
  user_id: 2, subscription_id: 2, video_id: 1,
  created_at: DateTime.new( 2013, 8, 1, 12)
)
VideoView.create(
  user_id: 2, subscription_id: 2, video_id: 5,
  created_at: DateTime.new( 2013, 8, 1, 12)
)
VideoView.create(
  user_id: 1, subscription_id: 1, video_id: 3,
  created_at: DateTime.new( 2013, 8, 1, 12)
)
VideoView.create(
  user_id: 1, subscription_id: 1, video_id: 2,
  created_at: DateTime.new( 2013, 8, 2, 12)
)
VideoView.create(
  user_id: 1, subscription_id: 1, video_id: 2,
  created_at: DateTime.new( 2013, 8, 9, 12)
)
VideoView.create(
  user_id: 2, subscription_id: 2, video_id: 3,
  created_at: DateTime.new( 2013, 8, 10, 12)
)
VideoView.create(
  user_id: 2, subscription_id: 2, video_id: 2,
  created_at: DateTime.new( 2013, 8, 10, 12)
)
VideoView.create(
  user_id: 3, subscription_id: 4, video_id: 5,
  created_at: DateTime.new( 2013, 8, 11, 12)
)
VideoView.create(
  user_id: 1, subscription_id: 1, video_id: 5,
  created_at: DateTime.new( 2013, 8, 31, 12)
)
VideoView.create(
  user_id: 1, subscription_id: 1, video_id: 1,
  created_at: DateTime.new( 2013, 10, 10, 12)
)
Video.create(
  producer_id: 1,  title: 'Pythagorean theorem - simple explanation'
)
Video.create(
  producer_id: 1, title: 'Rational functions'
)
Video.create(
  producer_id: 2, title: 'What is an integral?'
)
Video.create(
  producer_id: 2, title: 'Sine, cosine, and tangent'
)
Video.create(
  producer_id: 2, title: 'How to solve quadratic equations'
)

Producer.create(name: 'Martin')
Producer.create(name: 'Steve')
