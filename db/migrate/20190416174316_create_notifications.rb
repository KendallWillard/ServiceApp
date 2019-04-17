class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.text :title
      t.text :description
      t.references :appointment
      t.references :service
      t.references :posting
    end
  end
end
