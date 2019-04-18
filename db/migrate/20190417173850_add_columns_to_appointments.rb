class AddColumnsToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :description, :string
    add_reference :appointments, :service, foreign_key: true
    add_reference :appointments, :service_provider, foreign_key: true
    add_reference :appointments, :homeowner, foreign_key: true

  end
end
