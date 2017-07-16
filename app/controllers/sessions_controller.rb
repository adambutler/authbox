class SessionsController < ApplicationController
  def create
    session[:auth_hash] = auth_hash

    if session[:doorkeeper_restore]
      redirect_to session[:doorkeeper_restore]
    else
      redirect_to '/'
    end
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
