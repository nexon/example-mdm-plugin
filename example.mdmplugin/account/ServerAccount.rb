class ServerAccount
	def initialize(username, password)
		@username = username
		@password = password
		#"Hi! #{username}. Your password is #{password} - #{self}"
	end

	def on_login 
		#val = JSON::parse('{"verdadero":"bar"}')
		@hashier = Hash.new
		@hashier["error"] = false
		#@hashier["message"] = "Esto deberia funcionar para cargar login ;D, con usuario: #{@username} y #{@password} - #{self} - #{val} && #{val["verdadero"]} - keys: #{val.keys}"
		@hashier[:cookies] = "some cookies here! ;D"
		@hashier["message"] = do_something
		
		@hashier
	end

	def do_something
		ret = ""
		#url = "http://ajax.googleapis.com/ajax/services/search/web?v=1.0&q=mruby&rsz=large"
		#for result in JSON::parse(Curl::get(url).body)['responseData']['results']
		#	ret += "#{result['titleNoFormatting']}\n  #{result['url']}"
		#end
		ret = Curl::get("http://www.ruby-lang.org/ja/", {"User-Agent"=>"curl"}).body
		ret
	end
end