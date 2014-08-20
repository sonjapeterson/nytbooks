class TimelinesController < ApplicationController
	def overalllinechart
		sortedbooks = Book.all.sort { |a,b| b.weeksonlist <=> a.weeksonlist }
		@books = sortedbooks.take(20)
		@list = List.find(@books.first.list_id)
	end

	def testchart
	end
end
