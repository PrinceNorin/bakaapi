class ApplicationController < JSONAPI::ResourceController
  before_action :verify_token!

  def verify_token!
    unless doorkeeper_token.try(:accessible?)
      render json: {
        errors: [
          { title: 'Invalid token' }
        ]
      }, status: 401
    end
  end

  def signed_in?
    current_user.present?
  end

  def current_user
    doorkeeper_token
  end

  def context
    { current_user: current_user }
  end

  rescue_from Pundit::NotAuthorizedError do
    render json: {
      errors: [
        { title: '403 forbidden' }
      ]
    }, status: 403
  end
end
