module TimelinesHelper
	def titlecaps(title)
		title = title.downcase.split(" ")
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
