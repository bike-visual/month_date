require "month_date/version"
require "time"
require "date"

module MonthDate
    def MonthDate.week_date_in_month(year, month, week, format="%Y%m%d")
        days = self.days_in_month(year, month)
        result = []
        1.upto(days) do |day|
            date = Date.new(year, month, day)
            if date.wday == week
                result << date.strftime(format)
            end
        end
        return result
    end

    def MonthDate.days_in_month(year, month)
        Date.new(year, month, -1).day
    end

    def MonthDate.dates_in_range(start_date, end_date, format="%Y%m%d")
        start_date = Time.parse(start_date.to_s)
        end_date = Time.parse(end_date.to_s)
        result = []
        if start_date.mon == end_date.mon && start_date.year == end_date.year
            (start_date.day..end_date.day).to_a.each do |day|
                date = Date.new(start_date.year, start_date.mon, day)
                result << date.strftime(format)
            end
        elsif start_date.year == end_date.year
            # first count the start date month date.
            (start_date.day..self.days_in_month(start_date.year, start_date.mon)).to_a.each do |day|
                date = Date.new(start_date.year, start_date.mon, day)
                result << date.strftime(format)
            end
            (start_date.mon+1..end_date.mon-1).to_a.each do |month|
                result += self.date_in_month(start_date.year, month)
            end
            (1..end_date.day).each do |day|
                date = Date.new(end_date.year, end_date.mon, day)
                result << date.strftime(format)
            end
        else
            (start_date.day..self.days_in_month(start_date.year, start_date.mon)).to_a.each do |day|
                date = Date.new(start_date.year, start_date.mon, day)
                result << date.strftime(format)
            end
            (start_date.mon+1..12).to_a.each do |month|
                result += self.date_in_month(start_date.year, month)
            end
            (1..end_date.mon-1).to_a.each do |month|
                result += self.date_in_month(end_date.year, month)
            end
            (1..end_date.day).each do |day|
                date = Date.new(end_date.year, end_date.mon, day)
                result << date.strftime(format)
            end
        end
        return result
    end

    def MonthDate.date_in_month(year, month, format="%Y%m%d")
        days = self.days_in_month(year, month)
        ary = []
        1.upto(days) do |day|
            date = Date.new(year, month, day)
            ary << date.strftime(format)
        end
        return ary
    end
end