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

    def MonthDate.dates_in_range(start_date, end_date, format="%Y%m%d", day_type=false)
        start_date = Time.parse(start_date.to_s)
        end_date = Time.parse(end_date.to_s)
        weekend = []
        weekday = []
        if start_date.mon == end_date.mon && start_date.year == end_date.year
            (start_date.day..end_date.day).to_a.each do |day|
                date = Date.new(start_date.year, start_date.mon, day)
                if self.weekend?(date)
                    weekend << date.strftime(format)
                else
                    weekday << date.strftime(format)
                end
            end
        elsif start_date.year == end_date.year
            # first count the start date month date.
            (start_date.day..self.days_in_month(start_date.year, start_date.mon)).to_a.each do |day|
                date = Date.new(start_date.year, start_date.mon, day)
                if self.weekend?(date)
                    weekend << date.strftime(format)
                else
                    weekday << date.strftime(format)
                end
            end
            (start_date.mon+1..end_date.mon-1).to_a.each do |month|
                tmp = self.date_in_month(start_date.year, month, format, true)
                weekend += tmp[:weekend]
                weekday += tmp[:weekday]
            end
            (1..end_date.day).each do |day|
                date = Date.new(end_date.year, end_date.mon, day)
                if self.weekend?(date)
                    weekend << date.strftime(format)
                else
                    weekday << date.strftime(format)
                end
            end
        else
            (start_date.day..self.days_in_month(start_date.year, start_date.mon)).to_a.each do |day|
                date = Date.new(start_date.year, start_date.mon, day)
                if self.weekend?(date)
                    weekend << date.strftime(format)
                else
                    weekday << date.strftime(format)
                end
            end
            (start_date.mon+1..12).to_a.each do |month|
                tmp = self.date_in_month(start_date.year, month, format, true)
                weekend += tmp[:weekend]
                weekday += tmp[:weekday]
            end
            (1..end_date.mon-1).to_a.each do |month|
                tmp = self.date_in_month(end_date.year, month, format, true)
                weekend += tmp[:weekend]
                weekday += tmp[:weekday]
            end
            (1..end_date.day).each do |day|
                date = Date.new(end_date.year, end_date.mon, day)
                if self.weekend?(date)
                    weekend << date.strftime(format)
                else
                    weekday << date.strftime(format)
                end
            end
        end
        if day_type
            return {:weekday=>weekday, :weekend=>weekend}
        else
            return (weekday + weekend).sort
        end
    end

    def MonthDate.date_in_month(year, month, format="%Y%m%d", day_type=false)
        days = self.days_in_month(year, month)
        ary = []
        result = {:weekend=>[], :weekday=>[]}
        if day_type
            1.upto(days) do |day|
                date = Date.new(year, month, day)
                if self.weekend?(date)
                    result[:weekend] << date.strftime(format)
                else
                    result[:weekday] << date.strftime(format)
                end
            end
            return result
        else
            1.upto(days) do |day|

                date = Date.new(year, month, day)

                ary << date.strftime(format)
            end
            return ary
        end
    end

    def MonthDate.date_in_month_weekend(year, month, format="%Y%m%d")
        days = self.days_in_month(year, month)
        result = []
        1.upto(days) do |day|
            date = Date.new(year, month, day)
            result << date.strftime(format) if self.weekend?(date)
        end
        return result
    end

    def MonthDate.date_in_month_weekday(year, month, format="%Y%m%d")
        days = self.days_in_month(year, month)
        result = []
        1.upto(days) do |day|
            date = Date.new(year, month, day)
            result << date.strftime(format) unless self.weekend?(date)
        end
        return result
    end

    def self.weekend?(date)
        wday = date.wday
        if wday == 0 || wday == 6
            return true
        else
            return false
        end
    end
end