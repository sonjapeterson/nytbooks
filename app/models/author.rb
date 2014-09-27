class Author < ActiveRecord::Base
	has_many :books, counter_cache: true
end
