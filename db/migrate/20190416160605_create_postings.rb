class CreatePostings < ActiveRecord::Migration[5.2]
  def change
    create_table :postings do |t|
      t.string :title
      t.text :description
      t.string :before_image_url
      t.string :after_image_url
      t.text :start_date
      t.text :finish_date
      t.references :reviews
      t.references :homeowners
      t.timestamps
    end
  end
end
