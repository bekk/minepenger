require "spec_helper"
require "flekkefjord_sparebank"

describe TransactionParser::Formats::FlekkefjordSparebank do

  before(:each) do
    @format = TransactionParser::Formats::FlekkefjordSparebank
  end

  describe "parse method" do
    
    it "should return no transactions for an empty input string" do
      @format.parse("").should == []
    end

    it "should return transactions according to the input string" do
      data = IO.read(File.dirname(__FILE__) + "/flekkefjord_sparebank.csv")

      transactions = @format.parse(data)

      transactions.size.should == 2
      transactions[0][:date].should == Date.new(2010, 9, 17)
      transactions[0][:text].should == 
        "16.09 NARVESEN 365 LERKENDAL ST TRONDHEIM"
      transactions[0][:amount].should == -14
      transactions[1][:date].should == Date.new(2010, 8, 5)
      transactions[1][:text].should == "BEKK CONSULTING AS"
      transactions[1][:amount].should == 349.76
    end

  end

end
