# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'nytimes_bestsellers'

@client = Bestsellers.new
@client.configure do |config|
	config.api_key = ENV["NYTAPIKEY"]
end

def create_list(listname)
	listinfo = @client.get_list(listname)
	List.create(name: listname,
				length: listinfo['results'][0]['normal_list_ends_at'],
				updated: listinfo['results'][0]['updated'])
end

def save_list(listname, date)
	@client.get_list(listname, date: date)['results'].each do |result|
		if Book.exists?(:title => result['book_details'][0]['title'], list_id: List.find_by(name: listname).id)
			Rank.create(book_id: Book.find_by(
									title: result['book_details'][0]['title'], 
									list_id: List.find_by(name: listname).id).id,
						position: result['rank'],
						date: Date.parse(result['bestsellers_date']))
		else
			book = Book.create(title: result['book_details'][0]['title'], 
						author: result['book_details'][0]['author'],
			 			publisher: result['book_details'][0]['publisher'],
			 			description: result['book_details'][0]['description'],
			 			isbn: result['book_details'][0]['primary_isbn13'],
			 			price: result['book_details'][0]['price'].to_f,
			 			book_review_link: result['reviews'][0]['book_review_link'],
			 			sunday_review_link: result['reviews'][0]['sunday_review_link'],
			 			book_image: result['book_details'][0]['book_image'],
			 			list_id: List.find_by(name: listname).id
			 			 )
			Rank.create(book_id: book.id, 
						position: result['rank'], 
						date: Date.parse(result['bestsellers_date']))
		end
	end
end

create_list('E-book Fiction')
(Date.new(2013, 01, 01)..Date.new(2014, 01, 01)).step(7) do |date|
  save_list('E-book Fiction', date.to_s)
end

create_list('Hardcover Fiction')
(Date.new(2013, 01, 01)..Date.new(2014, 01, 01)).step(7) do |date|
  save_list('Hardcover Fiction', date.to_s)
end

create_list('Trade Fiction Paperback')
(Date.new(2013, 01, 01)..Date.new(2014, 01, 01)).step(7) do |date|
  save_list('Trade Fiction Paperback', date.to_s)
end

create_list('Mass Market Paperback')
(Date.new(2013, 01, 01)..Date.new(2014, 01, 01)).step(7) do |date|
  save_list('Mass Market Paperback', date.to_s)
end
