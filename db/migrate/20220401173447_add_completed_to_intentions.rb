class AddCompletedToIntentions < ActiveRecord::Migration[7.0]
  def change
    add_column :intentions, :completed, :string, :default => "Ongoing"
  end
end
