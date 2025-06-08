class AddIndexesToUsers < ActiveRecord::Migration[7.1]
  def change
    add_index :users, :email, unique: true
    add_index :users, :github_id, unique: true
    add_index :users, :github_username
  end
end
