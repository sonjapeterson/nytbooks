class Book < ActiveRecord::Base
	has_many :ranks
	scope :list, -> (list) { where list_id: list }

	def weeksonlist
		self.ranks.count
	end

	def slug
		# downcase all letter, remove trailing whitespace, replace spaces with dashes
		self.title.downcase.strip.gsub(' ', '_').gsub(/[^\w-]/, '')
	end

end
