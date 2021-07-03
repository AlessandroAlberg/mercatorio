class CreateCustomerPaymentInfos < ActiveRecord::Migration[5.0]
  def up
    create_table :books do |t|
    	t.integer "book_id", :limit => 5
    	t.string "title",
    	t.string "author",
    	t.string "publishing_company",
    	t.string "number_pages",
      t.boolean "read",
    	t.float "note",
      t.timestamps
    end
  end

  def down
  	drop_table :books
  end
end
