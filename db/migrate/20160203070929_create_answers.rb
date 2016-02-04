class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :commenter
      t.string :ans
      t.references :post, index: true

      t.timestamps
    end
  end
end
