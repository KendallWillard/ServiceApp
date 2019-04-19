class AddColumnToServiceProviders < ActiveRecord::Migration[5.2]
  def change
    add_column :service_providers, :image_url, :string
  end
end
