class Book < ApplicationRecord
	self.table_name = "book"

	scope :sorted, lambda { order("title ASC")}
	scope :search, lambda {|actor_search| where(["title LIKE ?", "#{book_search}%"]) }
	scope :letter, lambda {|first_letter| where(["title LIKE ?", "#{first_letter}%"])}

	def title
		"#{title}"
	end

	validates :title, 
		presence: true, 
		format: { with: /\A[a-zA-Z ]+\z/, message: "only allows letters" }, 
		length: { maximum: 45 }

end
