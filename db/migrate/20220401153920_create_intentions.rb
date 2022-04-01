class CreateIntentions < ActiveRecord::Migration[7.0]
  def change
    create_table :intentions do |t|
      t.string :name, :null => false
      t.references :user, :null => false
      t.string :status, :null => false, :default => "public" 
      t.timestamps
    end
  end
end
