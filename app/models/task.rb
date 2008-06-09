class Task < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    short_description :string, :name => true
    full_description :text
    status :string
    timestamps
  end

  acts_as_list :scope => :project

  never_show :position
  
  belongs_to :project
  belongs_to :user, :creator => true
  has_many :steps, :dependent => :destroy
  
#  def number
#    "T#{project.id}_#{self.id}"
#  end
#  
#  alias_method :name, :number
#  self.name_attribute = :number
  
  # --- Hobo Permissions --- #

  def creatable_by?(user)
    !user.guest? && self.user == user
  end

  def updatable_by?(user, new)
    user.administrator? || (user == self.user && (new.nil? || user == new.user))
  end

  def project_editable_by?(user)
    false
  end

  def deletable_by?(user)
    user.administrator?
  end

  def viewable_by?(user, field)
    true
  end

end
