require "month_date/version"
require "time"
require "date"

module MonthDate
    def MonthDate.week_date_in_month(year, month, week)
        days = self.days_in_month(year, month)
        result = []
        1.upto(days) do |day|
            date = Date.new(year, month, day)
            if date.wday == week
                result << date.strftime("%Y%m%d")
            end
        end
        return result
    end

    def MonthDate.days_in_month(year, month)
        Date.new(year, month, -1).day
    end

    def MonthDate.date_in_month(year, month)
        days = self.days_in_month(year, month)
        ary = []
        days.upto(1) do |day|
            date = Date.new(year, month, day)
            ary << date.strftime("%Y%m%d")
        end
        return ary
    end
end