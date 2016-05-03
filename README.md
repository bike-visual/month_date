# MonthDate

`month_date` is a ruby gem to help you get the date more easily.

## Usage

    require('month_date')

## Method
### get dates in specific week

    MonthDate.week_date_in_month(year, month, week)

example:

```ruby
MonthDate.week_date_in_month(2014, 1, 1) # get all Monday dates in 2014/1

=> ["20140106", "20140113", "20140120", "20140127"]
```
### get dates in range

    MonthDate.dates_in_range(start_date, end_date)

example:

```ruby
MonthDate.dates_in_range("20141230", "20150102")

=> ["20141230", "20141231", "20150101", "20150102"]
```
### get all dates in month

you can get all dates in specific month

    MonthDate.date_in_month(year, month, format, day_type)
    
#### parameter

* year: year
* month: month
* format: **default: %Y%m%d** ; the date output format
* day_type: **default: false**; whether you want to seperate the weekday and weekend

**example:**

```ruby
MonthDate.date_in_month(2014, 1)

=> ["20140101", "20140102", "20140103", "20140104", "20140105", "20140106", "20140107", "20140108", "20140109", "20140110", "20140111", "20140112", "20140113", "20140114", "20140115", "20140116", "20140117", "20140118", "20140119", "20140120", "20140121", "20140122", "20140123", "20140124", "20140125", "20140126", "20140127", "20140128", "20140129", "20140130", "20140131"]
```

**example: day_type=true**

```ruby
MonthDate.date_in_month(2014, 1, "%Y%m%d", true)

=>{:weekend=>["20140104", "20140105", "20140111", "20140112", "20140118", "20140119", "20140125", "20140126"], :weekday=>["20140101", "20140102", "20140103", "20140106", "20140107", "20140108", "20140109", "20140110", "20140113", "20140114", "20140115", "20140116", "20140117", "20140120", "20140121", "20140122", "20140123", "20140124", "20140127", "20140128", "20140129", "20140130", "20140131"]}
```
### date_in_month_weekday
	
	MonthDate.date_in_month_weekday(year, month, format)
	
### date_in_month_weekend

	MonthDate.date_in_month_weekend(year, month, format)

#### parameter
##### week
| 0 | Sunday    |
|---|-----------|
| 1 | Monday    |
| 2 | Tuesday   |
| 3 | Wednesday |
| 4 | Thursday  |
| 5 | Friday    |
| 6 | Saturday  |
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'month_date'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install month_date

## Development

### Test

    guard

## Todo

* Need to refactor!


## License 
MIT [@ctxhou](http://github.com/ctxhou)