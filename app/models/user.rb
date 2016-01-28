class User < ActiveRecord::Base
	has_many :cars #
	has_secure_password

	def slug
		self.username.gsub(/\ /, "-").downcase
	end

	def self.find_by_slug(slug)
		# avi-flombaum
		# Avi Flombaum

		self.find(username: => self.username_from_slug(slug))
	end

	private

		def self.username_from_slug(slug)
			slug.split("-").collect{|s| s.capitalize}.join(" ")
			# "avi-flombaum" ["avi", "flombaum"]
		end
end
