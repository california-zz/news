module HomeHelper
	def can_delete?(id)
		if !session[:Session_User].nil?
			session[:Session_User][:id] == id	
		else
			return false
		end
	end

end
