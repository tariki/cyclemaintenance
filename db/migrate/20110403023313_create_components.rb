class CreateComponents < ActiveRecord::Migration
  def self.up
    create_table :components do |t|
      t.string :item
      t.string :manufacturer
      t.string :group_name
      t.string :model_name
      t.integer :weight
      t.integer :bike_id

      t.timestamps
    end
    add_index :components, :bike_id
  end

  def self.down
    drop_table :components
  end
end
