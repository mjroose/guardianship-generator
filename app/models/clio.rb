class Clio

  def self.get_user_info_from(code)
    if tokens = self.get_tokens(code)
      request_token = self.get_request_token(tokens[:access_token])
      response = request_token.get('/api/v4/users/who_am_i', params: {fields: 'email'})
      if response.try(:body)
        {
          email: self.extract_email(response),
          access_token: tokens[:access_token],
          refresh_token: tokens[:refresh_token]
        }
      end
    end
  end

  private
    def self.client
      OAuth2::Client.new(ENV['CLIO_KEY'], ENV['CLIO_SECRET'], :site => 'https://app.clio.com/')
    end

    def self.callback_uri
      'http://localhost:3000/clio/callback'
    end

    def self.get_tokens(code)
      token = self.client.auth_code.get_token(code, :redirect_uri => self.callback_uri)
      if token.try(:token) && token.try(:refresh_token)
        { access_token: token.token, refresh_token: token.refresh_token }
      else
        nil
      end
    end

    def self.get_request_token(access_token)
      OAuth2::AccessToken.new(self.client, access_token)
    end

    def self.extract_email(response)
      body_hash = JSON.parse(response.body)
      if body_hash["data"] && body_hash["data"]["email"]
        body_hash["data"]["email"]
      else
        nil
      end
    end
end