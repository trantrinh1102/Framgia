class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.references :category, index: true, foreign_key: true
      t.string :content

      t.timestamps null: false
    end
  end
end
