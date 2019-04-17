class AddUsernameAndPasswordToServiceProviders < ActiveRecord::Migration[5.2]
  def change
    add_column :service_providers, :username, :string
    add_column :service_providers, :password_digest, :string
  end
end
