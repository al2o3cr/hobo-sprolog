class Project < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    description :textile
    timestamps
  end

  belongs_to :user, :creator => true
  has_many :tasks, :order => "position", :dependent => :destroy
  
  # --- Hobo Permissions --- #

  def creatable_by?(user)
    !user.guest? && self.user == user
  end

  def updatable_by?(user, new)
    user.administrator? || (user == self.user && (new.nil? || user == new.user))
  end

  def deletable_by?(user)
    user.administrator? || user == self.user
  end

  def viewable_by?(user, field)
    user.administrator? || user == self.user
  end

end
