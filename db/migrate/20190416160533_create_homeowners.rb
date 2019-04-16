class CreateHomeowners < ActiveRecord::Migration[5.2]
  def change
    create_table :homeowners do |t|
      t.text :first_name
      t.text :last_name
      t.text :street_name
      t.text :city
      t.text :state
      t.integer :zipcode
      t.text :email
      t.references :postings
      t.timestamps
    end
  end
end
