class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications_tables do |t|
      t.text :title
      t.text :description
      t.references :appointments
      t.references :services
      t.references :postings
    end
  end
end
