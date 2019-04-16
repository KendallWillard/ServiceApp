class AddColumnToHomeowner < ActiveRecord::Migration[5.2]
  def change
    add_column :homeowners, :password_digest, :string
    add_column :homeowners, :username, :string
  end
end
