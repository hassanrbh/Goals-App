class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, :null => false, :unique => true
      t.string :password_digest, :null => false, :unique => true
      t.string :username, :null => false, :unique => true
      t.integer :birth_date, :null => false
      t.timestamps
    end
  end
end
