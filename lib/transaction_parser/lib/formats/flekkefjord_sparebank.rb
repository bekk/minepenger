require "date"

module TransactionParser::Formats

  class FlekkefjordSparebank

    def self.parse(data)
      data.split("\n").select { |line| line =~ /^\d/ }.collect do |line|
	fields = line.split("\t")
	
	transaction = {}
	transaction[:date] = Date.strptime(fields[0], "%d.%m.%Y")
	transaction[:text] = fields[1]

	if fields[2].strip != ""
	  transaction[:amount] = - fields[2].sub(',', '.').to_f
	else
	  transaction[:amount] = fields[3].sub(',', '.').to_f
	end

	transaction
      end
    end

  end

end
