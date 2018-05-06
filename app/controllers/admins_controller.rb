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

      if params.has_key?(:user)

        if !((params[:user][:input_roles]).include? "admin")
          @user.remove_role :admin
        end
        if !((params[:user][:input_roles]).include? "disabled")
          @user.remove_role :disabled
        end

        params[:user][:input_roles].each do |role_name|
          if role_name == "admin"
            @user.add_role :admin
          elsif role_name == "disabled"
            @user.add_role :disabled
          end
        end
      else
        @user.remove_role :admin
        @user.remove_role :disabled
      end

      if !(@user.has_role? :normal)
        @user.add_role :normal
      end

    end
    
    redirect_to :edit_permissions
  end

  private

  def user_params
      params.permit(:role, :is_disabled, input_roles: [])
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
