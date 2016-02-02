class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :question
      t.string :commenter

      t.timestamps
    end
  end
end
