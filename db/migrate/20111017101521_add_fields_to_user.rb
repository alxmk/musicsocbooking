class AddFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :confirmed, :boolean, :default => false
    add_column :users, :admin, :boolean, :default => false
    
    add_index :users, :confirmed
  end

  def self.down
    remove_column :users, :admin
    remove_column :users, :confirmed
  end
end
