class CreateUserComments < ActiveRecord::Migration[7.0]
  def change
    create_table :user_comments do |t|
      t.text :comment, :null => false
      t.references :user
      t.timestamps
    end
  end
end
