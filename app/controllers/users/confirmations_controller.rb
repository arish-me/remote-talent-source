# frozen_string_literal: true

# app/controllers/users/confirmations_controller.rb
module Users
  class ConfirmationsController < Devise::ConfirmationsController
    # POST /resource/confirmation
    def create
      self.resource = resource_class.send_confirmation_instructions(resource_params)
      yield resource if block_given?
      if successfully_sent?(resource)
        store_confirmation_resource(resource)
        redirect_to confirmation_sent_path
      else
        respond_with(resource)
      end
    end

    # GET /resource/confirmation_sent
    def confirmation_sent
      if session['confirmation_resource'].present?
        @resource_email = session.delete(:confirmation_resource)
        render
      else
        redirect_to root_path
      end
    end

    # GET /resource/confirmation?confirmation_token=abcdef
    def show
      self.resource = resource_class.confirm_by_token(params[:confirmation_token])
      yield resource if block_given?

      if resource.errors.empty?
        set_flash_message!(:notice, :confirmed)
        respond_with_navigational(resource) { redirect_to after_confirmation_path_for(resource_name, resource) }
      else
        respond_with_navigational(resource.errors, status: :unprocessable_entity) { render :new }
      end
    end

    private

    def store_confirmation_resource(resource)
      session[:confirmation_resource] = resource.email
    end
  end
end
