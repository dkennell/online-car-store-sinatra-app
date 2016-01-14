class CreateCars < ActiveRecord::Migration
  def change
  	create_table :cars do |t|
  		t.string :brand
  		t.string :name
  		t.integer :make_year
  		t.integer :user_id

  		t.timestamp null: false
  	end
  end
end