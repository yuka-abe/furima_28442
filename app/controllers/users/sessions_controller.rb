# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  # super
  # end

  # POST /resource/sign_in
  # def create
  # super
  # end

  # DELETE /resource/sign_out
  # def destroy
  # super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # configure_account_update_params
  # devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end
end
