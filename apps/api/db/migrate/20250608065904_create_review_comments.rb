class CreateReviewComments < ActiveRecord::Migration[7.1]
  def change
    create_table :review_comments do |t|
      t.string :file_path
      t.integer :line_number
      t.text :comment
      t.string :severity
      t.text :suggestion
      t.references :review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
