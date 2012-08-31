class Post < ActiveRecord::Base
	belongs_to :user
	self.primary_key = :id
	validates :title, :presence => true, :length => { :maximum => 40 }
	validates :content, :presence => true, :length => { :maximum => 1000 }
	

end
