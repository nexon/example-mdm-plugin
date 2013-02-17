class ServerAccount
	def initialize(username, password)
		@username = username
		@password = password
		#"Hi! #{username}. Your password is #{password} - #{self}"
	end

	def on_login 
		"Esto deberia funcionar para cargar login ;D, con usuario: #{@username} y #{@password} - #{self}"
	end
end