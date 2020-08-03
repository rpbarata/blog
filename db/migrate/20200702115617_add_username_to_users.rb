class AddUsernameToUsers < ActiveRecord::Migration[6.0]

  def change
    add_column :users, :username, :string

    add_index :users, :username, unique: true
    add_index :users, [:username, :email], unique: true
  end

end
