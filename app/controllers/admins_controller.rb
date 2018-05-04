class AdminsController < ApplicationController

  before_action :restrict_to_admin, only: [:index, :edit_permissions, :update_permissions, :edit_enablement, :update_enablement, :edit_user_deletion, :destroy_user]

  def index

  end

  def edit_permissions
    @users = User.all
  end

  def update_permissions
    @user = User.find(params[:id])

    if @user.update(user_params)
      if params[:user][:roles_attributes]['0'][:name] == "admin"
        @user.remove_role :normal
        @user.save
        @user.add_role :admin
        @user.save
      else
        @user.remove_role :admin
        @user.save
        @user.add_role :normal
        @user.save
      end
    end
    
    redirect_to :edit_permissions
  end

  def edit_enablement
    @users = User.all
  end

  def update_enablement
    @user = User.find(params[:id])
    if @user.update(user_params)

      if params[:user][:is_disabled] == "true"
        @user.is_disabled = true
      else
        @user.is_disabled = false
      end
    end
    @user.save
    redirect_to :edit_enablement
  end

  def edit_user_deletion
    @users = User.all
  end

  def destroy_user
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :edit_user_deletion
  end

  private

  def user_params
    params.require(:user).permit(:role, :is_disabled, roles_attributes:[:name,:id])
  end

  def restrict_to_admin
    if !user_signed_in?
      redirect_to root_path
    end

    if !(current_user.has_role? :admin)
      redirect_to root_path
    end

  end

end
