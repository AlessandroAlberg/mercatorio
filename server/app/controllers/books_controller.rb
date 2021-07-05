class BooksController < ApplicationController
	
	before_action :customer_logged_in

	def index
		@user = User.find(session[:user_id])
		@rented_book = @user.books.sorted
	end

	def show
		
	end
end
