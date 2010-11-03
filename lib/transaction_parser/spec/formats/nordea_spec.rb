require "spec_helper"

describe TransactionParser::Formats::Nordea do

  before(:each) do
    @format = TransactionParser::Formats::Nordea
  end

  describe "parse method" do
    
    it "should return no transactions for an empty input string" do
      @format.parse(nil).should == []
    end

    it "should return transactions according to the input string" do
      data = File.dirname(__FILE__) + "/nordea.xls"

      transactions = @format.parse(data)


      transactions.size.should == 3

      transactions[0][:date].should == Date.new(2010, 9, 11)
      transactions[0][:text].should == "NORDEA HK TRONDHEIM, RAVNKLOA 02:03"
      transactions[0][:amount].should == -200.0
      transactions[1][:date].should == Date.new(2010, 9, 11)
      transactions[1][:text].should == "BURGER KING5018 TRONDHEIM             NO"
      transactions[1][:amount].should == -230.0
      transactions[2][:date].should == Date.new(2010, 8, 31)
      transactions[2][:text].should == "Ingen beskrivelse tilgjengelig"
      transactions[2][:amount].should == 240000.0
    end
  end

end
