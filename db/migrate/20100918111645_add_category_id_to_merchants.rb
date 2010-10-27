class AddCategoryIdToMerchants < ActiveRecord::Migration
  def self.up
    add_column :merchants, :category_id, :integer
  end

  def self.down
    remove_column :merchants, :category_id
  end
end
