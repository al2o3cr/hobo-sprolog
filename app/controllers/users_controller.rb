class UsersController < ApplicationController

  hobo_openid_user_controller

  auto_actions :all, :except => [ :index, :create ]

end
