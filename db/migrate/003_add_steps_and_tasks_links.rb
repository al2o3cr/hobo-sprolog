class AddStepsAndTasksLinks < ActiveRecord::Migration
  def self.up
    add_column :steps, :task_id, :integer
    
    add_column :tasks, :project_id, :integer
  end

  def self.down
    remove_column :steps, :task_id
    
    remove_column :tasks, :project_id
  end
end
