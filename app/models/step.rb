class Step < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    description :text
    timestamps
  end

  acts_as_list :scope => :task
  
  never_show :position
  self.name_attribute = :position
  
  belongs_to :task
  belongs_to :user, :creator => true
  
  # --- Hobo Permissions --- #

  def creatable_by?(user)
    !user.guest? && self.user == user
  end

  def updatable_by?(user, new)
    user.administrator? || (user == self.user && (new.nil? || user == new.user))
  end

  def task_editable_by?(user)
    false
  end
  
  def deletable_by?(user)
    user.administrator?
  end

  def viewable_by?(user, field)
    true
  end

end
