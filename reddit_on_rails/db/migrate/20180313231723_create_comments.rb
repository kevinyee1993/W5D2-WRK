class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :parent_comment_id
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
