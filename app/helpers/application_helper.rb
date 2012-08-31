module ApplicationHelper
	def show_title(title)

		if title.nil?
			title = "My blog"
		else
			title = "My blog | " + title
		end

	end

end
