class CreatePossibilities < ActiveRecord::Migration
  def change
    create_table :possibilities do |t|
      t.integer :a
      t.integer :b
      t.integer :c
      t.integer :x
      t.integer :y
      t.integer :z
      t.string :state
      t.timestamps
    end
  end
end
