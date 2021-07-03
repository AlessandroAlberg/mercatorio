class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :user do |t|
      t.string "name", :limit => 25
      t.string "email", :limit => 40
      t.string "password"

      t.timestamps
    end
  end
end
