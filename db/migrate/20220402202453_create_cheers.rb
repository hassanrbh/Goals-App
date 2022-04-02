class CreateCheers < ActiveRecord::Migration[7.0]
  def change
    create_table :cheers do |t|
      t.integer :giver_id, :null => false
      t.integer :intention_id, :null => false
      t.timestamps
    end
    add_index :cheers, :giver_id
    add_index :cheers, %i(intention_id giver_id), unique: true
  end
end
