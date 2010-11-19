require "date"

module TransactionParser::Formats

  class Fokus

      def self.parse(file)
        file.readlines.select { |line| line =~ /^"\d/ }.collect do |line|
          fields = line.gsub!("\"","").split(";")

          transaction = {}
          transaction[:date] = Date.strptime(fields[0], "%d.%m.%Y")
          transaction[:merchant] = fields[1]
          transaction[:amount] = fields[2].sub(',', '.').to_f
        end

          transaction
      end
  end
end