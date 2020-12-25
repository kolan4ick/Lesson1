class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :body
      t.string :title
      t.string :username
      t.integer :views
      t.timestamps
    end
  end
end
