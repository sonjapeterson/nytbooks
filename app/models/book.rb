class Book < ActiveRecord::Base
	has_many :ranks

	def reverseposition
		(self.position - 20).abs
	end
end
