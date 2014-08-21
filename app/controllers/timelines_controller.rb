class TimelinesController < ApplicationController
	def listlinechart
		@books = Book.all
  		@books = @books.list(params[:list]).sort { |a,b| b.weeksonlist <=> a.weeksonlist }
		if params[:list] == 'all'
			@books = Book.all.sort { |a,b| b.weeksonlist <=> a.weeksonlist }
		end
		@books = @books.take(20)
	end

	def testchart
	end
end
