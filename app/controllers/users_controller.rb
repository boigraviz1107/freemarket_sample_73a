class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def logout
  end

  def card
  end
end