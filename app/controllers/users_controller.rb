class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.with_attached_image.order('certificate_number ASC').page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.includes(:articles).find(params[:id])
    render template: 'retirements/done' if @user.destroy
  end

  private

  def move_to_index
    redirect_to root_path if current_user.id != @user.id
  end
end
