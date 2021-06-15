class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_set
  before_action :move_to_index, except: :show
  
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
