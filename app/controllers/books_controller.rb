class BooksController < ApplicationController
	require 'json'
	def index
		@books = Book.all

		respond_to do |format|
		   format.html
		   format.json
		end
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.create(book_params)
	end

	def linechart
		@book = Book.find(1).to_json
		@ranks = Book.find(1).ranks
	end

private
	def book_params
		params.require(:book).permit(:title, :author, :description)
	end
end
