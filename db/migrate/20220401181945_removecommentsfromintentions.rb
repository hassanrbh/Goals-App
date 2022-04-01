class Removecommentsfromintentions < ActiveRecord::Migration[7.0]
  def change
    remove_column :intentions, :comment
  end
end
