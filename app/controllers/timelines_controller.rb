class TimelinesController < ApplicationController
	def listlinechart
  		@books = Book.all.list(params[:list]).sort { |a,b| b.weeksonlist <=> a.weeksonlist }
		if params[:list] == 'all' || params[:list] == nil
			@books = Book.all.sort { |a,b| b.weeksonlist <=> a.weeksonlist }
		end
		@books = @books.take(20)
	end

	def testchart
		@books = Book.all.sort { |a,b| b.weeksonlist <=> a.weeksonlist }
		@books = @books.take(20)
	end

	def testlegend
	end

end

