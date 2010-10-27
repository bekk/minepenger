class AddCategoryIdToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :category_id, :integer
  end

  def self.down
    remove_column :categories, :category_id
  end
end
