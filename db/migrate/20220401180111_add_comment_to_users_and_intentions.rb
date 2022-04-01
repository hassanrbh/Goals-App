class AddCommentToUsersAndIntentions < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :comment, :text
    add_column :intentions, :comment, :text
  end
end
