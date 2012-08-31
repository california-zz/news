class HomeController < ApplicationController
  def index

		@post = Post.all(:joins => 'inner join "users" on ("users".id = "posts".user_id)')
		

  end

end
