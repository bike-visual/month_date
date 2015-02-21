require 'spec_helper'

describe MonthDate do
    it "Return correct date" do
        expect(MonthDate.week_date_in_month(2014, 1, 1)).to eq ["20140106", "20140113", "20140120", "20140127"]
        expect(MonthDate.week_date_in_month(2014, 1, 1, "%F")).to eq ["2014-01-06", "2014-01-13", "2014-01-20", "2014-01-27"]
    end
end