class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.bigint :author_id
      t.string :title
      t.text :text

      t.timestamps
    end

    add_index :posts, :author_id
    add_foreign_key :posts, :users, column: :author_id
  end
end
