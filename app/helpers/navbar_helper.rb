module NavbarHelper
  def user_links
    content_tag :ul, class: "navbar-nav ml-auto" do
      if user_signed_in?
        concat user_link("Log Out", destroy_user_session_path, "delete")
      else
        concat user_link("Log In", new_user_session_path)
        concat user_link("Sign Up", new_user_registration_path)
      end
    end
  end

  def user_link(link_text, url_path, http_method = 'get')
    content_tag :li, class: "nav-item" do
      link_to link_text, url_path, class: "nav-link text-light", method: http_method
    end
  end
end

