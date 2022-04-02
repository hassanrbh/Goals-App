class AddCheerstoUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :cheers, :integer, :default => 12
  end
end
