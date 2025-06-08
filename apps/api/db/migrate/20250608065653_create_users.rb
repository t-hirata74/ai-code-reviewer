class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :github_id
      t.string :github_username
      t.text :github_token
      t.string :avatar_url

      t.timestamps
    end
  end
end
