class CreatePullRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :pull_requests do |t|
      t.integer :number
      t.string :title
      t.string :state
      t.string :github_id
      t.references :repository, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: true
      t.string :head_sha
      t.string :base_sha

      t.timestamps
    end
  end
end
