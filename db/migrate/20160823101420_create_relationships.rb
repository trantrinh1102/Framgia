class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :follower_id, index: true, unique: true
      t.integer :followed_id, index: true, unique: true

      t.timestamps null: false
    end
  end
end
