class Main
	MF_URL_TOKEN = "https://www.mediafire.com/api/user/get_session_token.php"
	MF_URL_INFO  = "http://www.mediafire.com/api/user/get_info.php"
	API_KEY = "m22fpp6hkd800gtho6kn66v3glwf6oon1me2n3fh"
	APP_ID = "33154"
	def initialize(username, password)
		@username = username
		@password = password
		@values = {}
	end


	def on_login
		response_token = JSON::parse(self.get_session_token)
		if self.error?(response_token)
			@values = {
				error: true,
				message: response_token["response"]["message"]
			}
		else 
			token = response_token["response"]["session_token"]
			resp_info = JSON::parse(self.get_info(token))
			if self.error?(resp_info)
				@values = {
					error: true,
					message: resp_info["response"]["message"]
				}
			else
				@values = {
					error: false,
					premium: resp_info["response"]["user_info"]["premium"],
					message: resp_info["response"]
				}
			end
		end
		@values
	end

	

	def get_session_token
		url = "#{MF_URL_TOKEN}?email=#{@username}&password=#{@password}&application_id=#{APP_ID}&signature=#{self.get_signature}&response_format=json"
		Curl::get(url).body
	end

	def get_info(token)
		url = "#{MF_URL_INFO}?session_token=#{token}&response_format=json"
		Curl::get(url).body
	end

	def get_signature
		SHA1.sha1_hex("#{@username}#{@password}#{APP_ID}#{API_KEY}")
	end

	def error?(resp)
		(resp["response"]["result"].eql?("Error"))
	end
end