class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.references :user
      t.integer :friend_id
      t.integer :status

      t.timestamps
    end
  end
end
