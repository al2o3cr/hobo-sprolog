class ProjectsController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => :index
  
  def index
    hobo_index Project.apply_scopes(:user_id_is => current_user.id)
  end
  
  def has_many_input(*args)
    ""
  end
end