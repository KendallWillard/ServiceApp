class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.text :name
      t.text :description
      t.references :service_provider
      t.references :notification 

      t.timestamps
    end
  end
end
