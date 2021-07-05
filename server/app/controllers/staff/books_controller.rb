class Staff::BooksController < ApplicationController

	before_action :staff_logged_in

	def index
		@books = Book.sorted
	end

	def show
		@book = Book.find(params[:id])
		@book_titles = @book.title
	end

end