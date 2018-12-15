class ClioController < ApplicationController
  def callback
    if params[:code]
      @user = User.find_or_create_by_clio_code(params[:code])
      if @user
        sign_in @user
        redirect_to guardianships_path
      end
    else
      redirect_to new_user_session_path
    end
  end

  def log_in
    redirect_to Clio.client.auth_code.authorize_url(:redirect_uri => Clio.callback_uri)
  end

end
