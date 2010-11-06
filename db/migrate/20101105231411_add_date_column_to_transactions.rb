class AddDateColumnToTransactions < ActiveRecord::Migration
  def self.up
    add_column :transactions, :date, :datetime
  end

  def self.down
    remove_column :transactions, :date
  end
end
