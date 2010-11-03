require "spec_helper"

describe TransactionParser do

  describe "formats method" do

    it "should not return any formats when none is present" do
      TransactionParser::Formats.should_receive(:constants)
        .and_return([])

      TransactionParser.formats.should == []
    end

    it "should return the formats present" do
      class TransactionParser::Formats::Test; end

      TransactionParser::Formats.should_receive(:constants)
        .and_return([:Test])

      TransactionParser.formats.should == [:Test]
    end

  end

end
