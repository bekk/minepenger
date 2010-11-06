require "spec_helper"
require "flekkefjord_sparebank"

describe TransactionParser::Formats::FlekkefjordSparebank do

  before(:each) do
    @format = TransactionParser::Formats::FlekkefjordSparebank
  end

  describe "parse method" do
    
    it "should return no transactions for an empty file" do
      empty_file = mock('file', :readlines => [])
      @format.parse(empty_file).should == []
    end

    it "should return transactions according to the input file" do
      file = File.open(File.dirname(__FILE__) + 
        "/flekkefjord_sparebank.csv")

      transactions = @format.parse(file)

      transactions.size.should == 2
      transactions[0][:date].should == Date.new(2010, 9, 17)
      transactions[0][:merchant].should ==
        "16.09 NARVESEN 365 LERKENDAL ST TRONDHEIM"
      transactions[0][:amount].should == -14
      transactions[1][:date].should == Date.new(2010, 8, 5)
      transactions[1][:merchant].should == "BEKK CONSULTING AS"
      transactions[1][:amount].should == 349.76
    end

  end

end
