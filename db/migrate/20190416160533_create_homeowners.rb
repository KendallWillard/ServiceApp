class CreateHomeowners < ActiveRecord::Migration[5.2]
  def change
    create_table :homeowners do |t|

      t.timestamps
    end
  end
end
