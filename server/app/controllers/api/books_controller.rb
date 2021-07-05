class Api::BooksController < ApplicationController

	skip_before_action :verify_authenticity_token

	def index
		books = Book.sorted
		render json: books
	end

	def show
		book = Book.find(params[:id])
		if book 
			render json: book
		else
			render json: 422
		end
	end

	def new
		render json: Book.new
	end

	def edit
		book = Book.find(params[:id])
		render json: book
	end

	def create
		book = Book.new(book_params)
		if book.save
			render json: { message: 'Success'}
		else
			render json: { message: 'Failure' }
		end
	end

	def update
		book = Book.find(params[:id])
		if book.update(book_params)
			render json: {
				status: 200,
				message: "Book successfully updated",
				book: book 
			}.to_json
		else
			render json: {
				status: 500,
				message: "Book failed to update",
				book: book
			}
		end
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy
		render json: {
			status: 200,
			message: "Book successfully deleted"
		}.to_json
	end

	private
		def book_params
			params.require(:book).permit(:title, :author, :publishing_company, :number_pages, :read, :note)
		end

end