class TimelinesController < ApplicationController
	def chart1
		@books = Book.take(20)
		@list = List.find(@books.first.list_id)
	end
end
