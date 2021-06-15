class UsersController < ApplicationController
  before_action :user_set

  def show
  end

  def destroy
    render template: "retirements/done" if @user.destroy
  end

  private

  def user_set
    @user = User.find(params[:id])
  end

end
