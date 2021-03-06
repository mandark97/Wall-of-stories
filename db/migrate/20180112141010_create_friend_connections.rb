class CreateFriendConnections < ActiveRecord::Migration[5.1]
  def change
    create_table :friend_connections do |t|
      t.integer :status

      t.belongs_to :user, foreign_key: true, index: true
      t.belongs_to :friend, index: true


      t.timestamps
    end

    add_foreign_key :friend_connections, :users, column: :friend_id
    add_index :friend_connections, [:user_id, :friend_id], unique: true
  end
end
