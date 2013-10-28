# ProducerPayout

calculates the revenue of a given video producer and a time period, based on
the amount of video views and overall revenue from subscribers

## Installation

    $ bundle

Before running tests:

    $ rake db:migrate

optional:

    $ rake db:seed

tests:

    $ rake

## Usage

 producer = Producer.find_by_name('Steve')
 period   = Date.new(2013, 8, 1)..Date.new(2013, 8, 31)

 payout = ProducerPayout::ProducerPayout.new(producer, period)
 sum = payout.calculate # => 20.28

