class Users::RegistrationsController < Devise::RegistrationsController
  before_action :set_user, only: %i[ destroy ]

  respond_to :json

  def destroy
    return unless @user == current_user
    @user.destroy
  end
  
  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: {
      message: 'Signed up sucessfully.',
      user: current_user
    }, status: :ok
  end

  def register_failed
    render json: { message: 'Something went wrong.' }, status: :unprocessable_entity
  end

  def set_user
    @user = current_user
  end
end