class ChangeColumnNameFromModeratorToUser < ActiveRecord::Migration[5.1]
  def change
    rename_column :subs, :moderator_id, :user_id
  end
end
