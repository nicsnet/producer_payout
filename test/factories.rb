require 'miniskirt'
Factory.define :subscription do |f|
  f.start_date Date.new(2013, 1, 1)
  f.end_date Date.new(2013, 12, 31)
  f.price 199.90
end

Factory.define :video do |f|
  f.title 'Lorem ipsum'
  f.producer { Factory :producer }
end

Factory.define :producer do |f|
  f.name { %w(Steve Martin Bob).sample }
end

Factory.define :video_view do |f|
  f.subscription { Factory :subscription }
  f.video { Factory :video }
end
