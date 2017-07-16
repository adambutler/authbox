class AuthorizedUsersController < ApplicationController
before_action :authenticate_user!

  def create
    application = current_user.oauth_applications.find(authorized_user_params[:application_id])
    authorized_user = AuthorizedUser.new({
      application: application,
      platform: authorized_user_params[:platform],
      username: authorized_user_params[:username],
    })

    if authorized_user.save
      flash[:notice] = "Created authorized user"
      redirect_to oauth_application_path(application)
    else
      flash[:alert] = "Could not create authorized user"
      redirect_to root_path
    end
  end

  def destroy
    authorized_user = AuthorizedUser.find_by({ id: params[:id] })

    if authorized_user && (current_user == authorized_user.application.owner)
      flash[:notice] = "Authorized user destoryed"
      authorized_user.destroy!
      redirect_to oauth_application_path(authorized_user.application)
    else
      flash[:alert] = "Could not destory authorized user"
      redirect_to root_path
    end
  end

  private

  def authorized_user_params
    params.require(:authorized_user).permit(:application_id, :platform, :username)
  end
end
