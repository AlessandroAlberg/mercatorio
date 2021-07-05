class CheckoutController < ApplicationController

	def new
		if session[:user_id]
			@user = User.find(session[:user_id])
			@user_session = session[:user_id]
		else
			redirect_to(account_access_login_path)
		end
	end

	def create
		@rental = Rental.new(rental_parameters)
		if @rental.save
			# redirect_to(ordered_checkout)
			flash[:notice] = "Your order has been successfully submitted"
		else
		end
	end

	private
		def rental_parameters
			params.require(:rental).permit(:rental_date, :inventory_id, :user_id)
		end

end