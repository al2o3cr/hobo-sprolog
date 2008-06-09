class User < ActiveRecord::Base

  hobo_openid_user_model # Don't put anything above this

  fields do
    openid :string, :login => true
    username :string, :name => true
    administrator :boolean, :default => false
    timestamps
  end

  set_simple_registration_mappings :required => { :nickname => :username }
  
  set_admin_on_first_user
  
  has_many :projects
  
  # --- Hobo Permissions --- #

  # It is possible to override the permission system entirely by
  # returning true from super_user?
  # def super_user?; true; end

  def creatable_by?(creator)
    creator.administrator? || !administrator
  end

  def updatable_by?(updater, new)
    updater.administrator?
  end

  def deletable_by?(deleter)
    deleter.administrator?
  end

  def viewable_by?(viewer, field)
    true
  end

end
