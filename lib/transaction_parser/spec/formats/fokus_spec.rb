require "spec_helper"
require "fokus"

describe TransactionParser::Formats::Fokus do

  before(:each) do
    @format = TransactionParser::Formats::Fokus
  end

  describe "parse method" do

    it "should return no transactions for an empty file" do
      empty_file = mock('file', :readlines => [])
      @format.parse(empty_file).should == []
    end

    it "should return transactions according to the input file" do
      file = File.open(File.dirname(__FILE__) + "/fokus.csv")

      transactions = @format.parse(file)

      transactions.size.should == 2

      transactions[0][:date].should == Date.new(2010, 08, 26)
      transactions[0][:merchant].should == "Amazon.Com"
      transactions[0][:amount].should == -843.68

      transactions[1][:date].should == Date.new(2010, 08, 26)
      transactions[1][:merchant].should == "Fra: 86010551422"
      transactions[1][:amount].should == 500.00
    end

  end

end
