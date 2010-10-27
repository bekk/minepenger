dir = File.dirname(__FILE__)

require File.expand_path('lib/transaction_parser', dir)

# Automatically load all formats
Dir.glob(File.expand_path('lib/formats/*.rb', dir)) do |format|
  require format
end
