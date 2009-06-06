class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :name, :slug, :cookiecode, :webcode
      t.boolean :complete, :default => false
      t.timestamps
    end
    add_index :tasks, :slug
  end

  def self.down
    drop_table :tasks
  end
end
