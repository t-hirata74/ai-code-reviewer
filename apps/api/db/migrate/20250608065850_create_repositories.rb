class CreateRepositories < ActiveRecord::Migration[7.1]
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :full_name
      t.string :github_id
      t.references :user, null: false, foreign_key: true
      t.boolean :webhook_configured

      t.timestamps
    end
  end
end
