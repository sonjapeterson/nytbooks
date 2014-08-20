class Rank < ActiveRecord::Base
	belongs_to :book

	def reverseposition
		(self.position - 21).abs
	end
end
