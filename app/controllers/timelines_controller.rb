class TimelinesController < ApplicationController
	def overalllinechart
		@books = Book.all
  		@books = @books.list(params[:list]).sort { |a,b| b.weeksonlist <=> a.weeksonlist } if params[:list].present?
		if !params[:list].present?
			@books = @books.sort { |a,b| b.weeksonlist <=> a.weeksonlist }
		end
		@books = @books.take(20)
	end

	def testchart
	end
end
