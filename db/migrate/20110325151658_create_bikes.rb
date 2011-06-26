class CreateBikes < ActiveRecord::Migration
  def self.up
    create_table :bikes do |t|
      t.string :manufacturer
      t.string :model_name
      t.string :frame_number
      t.integer :user_id
      t.string :image_filename
      t.integer :image_width
      t.integer :image_height

      t.timestamps
    end
    add_index :bikes, :user_id
  end

  def self.down
    drop_table :bikes
  end
end
