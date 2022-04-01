class AddCommentToUsersAndIntentions < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :comment
  end
end
