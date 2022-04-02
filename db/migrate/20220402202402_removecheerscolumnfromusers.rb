class Removecheerscolumnfromusers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :cheers
  end
end
