class TransactionParser

  module Formats
  end

  Dir.glob(File.dirname(__FILE__) + '/formats/*.rb') do |f|
    require f
  end

  def self.formats
    Formats.constants.select do |const|
      Formats.const_get(const)
    end
  end

end
