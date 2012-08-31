module UserHelper
	def hover_menu(page)
		if page.to_s ==request.request_uri.to_s
			raw "class='active'"
		else
			raw "class=''"
		end

	end
	def hover_menu_dropdown(page)
		if page.to_s ==request.request_uri.to_s
			raw "class='dropdown active'"
		else
			raw "class='dropdown'"
		end

	end
	

	def show_error(field)
		if @user.errors[field].empty?
			raw "class='control-group success'"
		else
			raw "class='control-group error'"
		end

	end
end
