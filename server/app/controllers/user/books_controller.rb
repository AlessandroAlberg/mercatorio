class user::BooksController < ApplicationController

  before_action :confirm_logged_in

  skip_before_action :verify_authenticity_token
   
  def index
    
  end

  def search
    @books = Book.search(params[:book_search]).sorted
    if @books.blank?
      flash[:notice] = "No match found"
    else
      flash[:notice] = nil
    end
  end

  def letter
    @books = Book.letter(params[:first_letter])
    if @books.blank?
      flash[:notice] = "No match for this letter"
    else
      flash[:notice] = nil
    end    
  end

  def show
    @book = Book.find(params[:id])
    @book_films = @book.films

    @films = Film.sorted

  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book '#{@book.title}' created. "
      redirect_to(user_books_path)
    else
      render('new')
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      flash[:notice] = "Book '#{@book.title}' updated. "
      redirect_to(user_books_path)
    else
      render('edit')
    end      
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = "Book '#{@book.title}' deleted. "
      redirect_to(user_books_path)
    end
  end

  private
    def book_params
      params.require(:book).permit(:title, :author, :publishing_company, :number_pages, :read, :note)
    end

end
