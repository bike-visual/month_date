require 'spec_helper'

describe MonthDate do
    it "Return correct date" do
        expect(MonthDate.week_date_in_month(2014, 1, 1)).to eq ["20140106", "20140113", "20140120", "20140127"]
        expect(MonthDate.week_date_in_month(2014, 1, 1, "%F")).to eq ["2014-01-06", "2014-01-13", "2014-01-20", "2014-01-27"]
    end

    it "test date_in_month" do 
        answer = {:weekend=>["20140104", "20140105", "20140111", "20140112", "20140118", "20140119", "20140125", "20140126"], :weekday=>["20140101", "20140102", "20140103", "20140106", "20140107", "20140108", "20140109", "20140110", "20140113", "20140114", "20140115", "20140116", "20140117", "20140120", "20140121", "20140122", "20140123", "20140124", "20140127", "20140128", "20140129", "20140130", "20140131"]}
        result = MonthDate.date_in_month(2014, 1, "%Y%m%d", true)
        expect(result).to eq answer
    end

    it "test date_in_month_weekend" do 
        answer = ["20140104", "20140105", "20140111", "20140112", "20140118", "20140119", "20140125", "20140126"]
        result = MonthDate.date_in_month_weekend(2014, 1, "%Y%m%d")
        expect(result).to eq answer
    end

    it "test date_in_month_weekend" do 
        answer = ["20140101", "20140102", "20140103", "20140106", "20140107", "20140108", "20140109", "20140110", "20140113", "20140114", "20140115", "20140116", "20140117", "20140120", "20140121", "20140122", "20140123", "20140124", "20140127", "20140128", "20140129", "20140130", "20140131"]
        result = MonthDate.date_in_month_weekday(2014, 1, "%Y%m%d")
        expect(result).to eq answer
    end

end