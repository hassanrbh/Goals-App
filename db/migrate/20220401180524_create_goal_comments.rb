class CreateGoalComments < ActiveRecord::Migration[7.0]
  def change
    create_table :goal_comments do |t|
      t.text :comment, :null => false
      t.references :intention
      t.timestamps
    end
  end
end
