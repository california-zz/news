module PostHelper
	def show_error(field)
		if @user.errors[field].empty?
			raw "class='control-group success'"
		else
			raw "class='control-group error'"
		end

	end
end
