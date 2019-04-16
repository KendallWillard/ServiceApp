class AddColumnsToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :amount, :float
    add_column :reviews, :rating, :float
    add_column :reviews, :description, :text
    add_column :reviews, :date, :text
    add_reference :reviews, :posting, foreign_key: true
  end
end
