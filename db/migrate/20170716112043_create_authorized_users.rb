class CreateAuthorizedUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :authorized_users, id: :uuid do |t|
      t.integer :application_id
      t.string :platform
      t.string :username

      t.timestamps
    end
  end
end
