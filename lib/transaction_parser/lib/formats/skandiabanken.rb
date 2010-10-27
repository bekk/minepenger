require "date"

module TransactionParser::Formats

  class Skandiabanken

    def self.parse(data)
      data.split("\n").select { |line| line =~ /^\d/ }.collect do |line|
	      fields = line.split(";")
        
	      transaction = {}
	      transaction[:date] = Date.strptime(fields[2], "%d.%m.%Y")
	      transaction[:text] = fields[5]

	      if fields[6].strip != "" # debit
	        transaction[:amount] = - fields[6].sub(',', '.').to_f
	      else # credit
	        transaction[:amount] = fields[7].sub(',', '.').to_f
	      end

	      transaction
      end
    end

  end

end
