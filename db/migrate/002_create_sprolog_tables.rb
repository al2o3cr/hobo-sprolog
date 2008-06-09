class CreateSprologTables < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string   :name
      t.text     :description
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :user_id
    end
    
    create_table :steps do |t|
      t.text     :description
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :tasks do |t|
      t.string   :short_description
      t.text     :full_description
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :projects
    drop_table :steps
    drop_table :tasks
  end
end
