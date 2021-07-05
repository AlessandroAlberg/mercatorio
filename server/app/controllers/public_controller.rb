class PublicController < ApplicationController
  
  def index
  	if session[:user_id]
    	@found_user = User.find(session[:user_id])
    	@user = @found_user.email
    end	
    
    if session[:pending_rent]
    	@cart_count = session[:pending_rent].count
    end
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


end
