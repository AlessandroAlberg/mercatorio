class Book < ApplicationRecord
	self.table_name = "book"

	scope :sorted, lambda { order("first_name ASC")}
	scope :search, lambda {|actor_search| where(["first_name LIKE ?", "#{book_search}%"]).or(where(["last_name LIKE ?", "#{book_search}%"])) }
	scope :letter, lambda {|first_letter| where(["first_name LIKE ?", "#{first_letter}%"])}

	def title
		"#{title}"
	end

	validates :title, 
		presence: true, 
		format: { with: /\A[a-zA-Z ]+\z/, message: "only allows letters" }, 
		length: { maximum: 45 }

end
