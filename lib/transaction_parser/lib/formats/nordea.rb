require "date"
require "spreadsheet"
module TransactionParser::Formats

  class Nordea

    def self.parse(excel_file)
      if (excel_file == nil)
        return []
      end
      book = Spreadsheet.open(excel_file)
      worksheet = book.worksheet('Bevegelser')

      transactions = []

      worksheet.each do |row|
        if row[1].class != DateTime
          next
        end
        transaction = {}
        transaction[:date] = row[1]
        transaction[:text] = row[5]
        if row[7] != nil # debit
	        transaction[:amount] = row[7]
        else # credit
          transaction[:amount] = row[9]
        end
        transactions << transaction
      end
      transactions
    end

  end

end
