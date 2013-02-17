class Host
	def initialize(credentials)
		@username = credentials[:username]
		@password = credentials[:password]
		@url      = credentials[:url]
	end

	def on_direct_url 
		"Esto deberia funcionar para cargar login ;D, con usuario: #{@username} y #{@password} además de la url: #{url}- #{self}"
	end
end