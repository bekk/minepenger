class TransactionParser

  module Formats
  end

  def self.formats
    Formats.constants.select do |const|
      Formats.const_get(const)
    end
  end

end
