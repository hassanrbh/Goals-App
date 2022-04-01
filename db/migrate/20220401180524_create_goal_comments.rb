class CreateGoalComments < ActiveRecord::Migration[7.0]
  def change
    create_table :goal_comments do |t|

      t.timestamps
    end
  end
end
