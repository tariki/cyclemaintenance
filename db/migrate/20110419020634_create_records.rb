class CreateRecords < ActiveRecord::Migration
  def self.up
    create_table :records do |t|
      t.date :maintain_at
      t.string :content
      t.integer :bike_id

      t.timestamps
    end
    add_index :records, :bike_id
  end

  def self.down
    drop_table :records
  end
end
