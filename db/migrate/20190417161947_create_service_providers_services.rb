class CreateServiceProvidersServices < ActiveRecord::Migration[5.2]
  def change
    create_table :service_providers_services do |t|
      t.references :service_provider
      t.references :service

      t.timestamps
    end
  end
end
