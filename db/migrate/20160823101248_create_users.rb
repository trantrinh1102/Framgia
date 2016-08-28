class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.boolean :gender
      t.string :password_digest
      t.string :avatar
      t.boolean :is_admin

      t.timestamps null: false
    end
  end
end
