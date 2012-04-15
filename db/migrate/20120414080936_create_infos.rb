class CreateInfos < ActiveRecord::Migration
  def self.up
    create_table :infos do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :infos
  end
end
