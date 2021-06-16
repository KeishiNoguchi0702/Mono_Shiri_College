class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_set, except: [:index]
  before_action :move_to_index, only: [:destroy]
  
  def index
    @users =  User.order("certificate_number ASC")
  end

  def show
  end

  def destroy
    render template: "retirements/done" if @user.destroy
  end

  private

  def user_set
    @user = User.find(params[:id])
  end

  def move_to_index
    redirect_to root_path if current_user.id != @user.id
  end

end
