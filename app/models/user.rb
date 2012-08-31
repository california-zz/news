require "digest"

class User < ActiveRecord::Base
	self.primary_key = :id
	attr_accessor :type
	has_many :post
	attr_accessible :username, :password,:password_confirmation,:fullname,:address
	attr_accessible :note, :if =>:has_value?
	validates_format_of :username, :with => /\A[a-zA-Z0-9]+\z/,  :message => "Only letters allowed" 
	validates_confirmation_of :password ,:if => :password_present?
	validates_length_of :password, :minimum => 6 ,:if => :password_present?
	validates_presence_of :password_confirmation ,:if => :password_present?
	validates_presence_of :fullname
	validates_uniqueness_of :username,:case_ensitive =>false
	before_save :encrypt_password ,:if => :password_present?

	def has_password?(submitted_password)
		en_password == encrypt(submitted_password)
	end

	def has_pass?(en_password,submitted_password)
		en_password == encrypt(submitted_password)
	end
	
	def self.authenticate(username, submitted_password)
		user = User.where(["username = ?", username]).first
		return nil if user.nil?

		return {:id => user["id"],:username => user["username"]}   if user.has_pass?(user['password'],submitted_password)
	end

#upload image

	private
		def encrypt_password
			self[:password] = encrypt(self[:password] )
				
		end

		def encrypt(string)
			secure_hash("#{string}")
		end

		def secure_hash(string)
			Digest::MD5.hexdigest(string)
		end

		def password_present?
			if @type =="edit"
				return false
			else 
				return true
			end
		end

		def has_value?
			!user['note'].nil? 
		end

end
