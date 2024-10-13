module Authentication
  extend ActiveSupport::Concern

  private

  def start_new_session_for(user)
    user.sessions.create!(user_agent: request.user_agent, ip_address: request.remote_ip).tap do |session|
      Current.session = session
      cookies.signed.permanent[:session_id] = { value: session.id, httponly: true, same_site: :lax }
    end
  end

  def after_authentication_url
    session.delete(:return_to_after_authenticating) || root_url
  end
end
