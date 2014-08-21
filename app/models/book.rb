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

	def titleformatted
		title = self.title.downcase.split(" ")
		result = [title[0].capitalize]
		title = title[1, title.length]
		downcasewords = ['a', 'an', 'the', 'at', 'by', 'for', 'in', 'of', 'on', 'to', 'up', 'and', 'as', 'but', 'it', 'or', 'nor']
		title.each do |word|
			if downcasewords.include? word
				result << word
			else
				result << word.capitalize
			end
		end
		result = result.join(" ")
	end

end
