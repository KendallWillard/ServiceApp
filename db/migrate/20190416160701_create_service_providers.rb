class CreateServiceProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :service_providers do |t|
      t.text :service_provider_type
      t.text :name
      t.text :street_name
      t.text :city
      t.text :state
      t.integer :zipcode
      t.text :service_area
      t.integer :years_in_service
      t.float :average_rating
      t.references :service

      t.timestamps
    end
  end
end
