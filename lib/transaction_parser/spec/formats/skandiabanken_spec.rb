require "spec_helper"
require "skandiabanken"

describe TransactionParser::Formats::Skandiabanken do

  before(:each) do
    @format = TransactionParser::Formats::Skandiabanken
  end

  describe "parse method" do
    
    it "should return no transactions for an empty file" do
      empty_file = mock('file', :readlines => [])
      @format.parse(empty_file).should == []
    end

    it "should return transactions according to the input file" do
      file = File.open(File.dirname(__FILE__) + "/skandiabanken.csv")

      transactions = @format.parse(file)

      transactions.size.should == 2
      
      transactions[0][:date].should == Date.new(2004, 10, 31)
      transactions[0][:merchant].should == "KREDITRENTER"
      transactions[0][:amount].should == 1.95
      
      transactions[1][:date].should == Date.new(2004, 10, 30)
      transactions[1][:merchant].should == "28.10 COOP MEGA MOHOLT TRONDHEIM"
      transactions[1][:amount].should == -17.9
    end

  end

end
