class ProfilesController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  def edit
  end

  def create
  end


  def set_user
    @user = current_user
  end
end
