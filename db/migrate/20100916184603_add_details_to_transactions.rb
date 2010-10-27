class AddDetailsToTransactions < ActiveRecord::Migration
  def self.up
    add_column :transactions, :merchant, :string
    add_column :transactions, :amount, :decimal
    add_column :transactions, :category_id, :integer
    add_column :transactions, :user_id, :integer
  end

  def self.down
    remove_column :transactions, :user_id
    remove_column :transactions, :category_id
    remove_column :transactions, :amount
    remove_column :transactions, :merchant
  end
end
