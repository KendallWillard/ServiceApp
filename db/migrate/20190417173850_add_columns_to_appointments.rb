class AddColumnsToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :description, :string
    add_reference :appointments, :services, foreign_key: true
    add_reference :appointments, :service_providers, foreign_key: true
    add_reference :appointments, :homeowners, foreign_key: true

  end
end
