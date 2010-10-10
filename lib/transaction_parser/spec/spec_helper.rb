require File.expand_path("../../lib/transaction_parser", __FILE__)

# Add formats directory to load path to ease loading of specific
# format classes in the corresponding specs
$:.unshift(File.expand_path("../../lib/formats", __FILE__))
