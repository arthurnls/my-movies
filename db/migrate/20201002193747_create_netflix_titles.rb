class CreateNetflixTitles < ActiveRecord::Migration[6.0]
  def change
    create_table :netflix_titles do |t|
      t.string :title
      t.text :description
      t.date :date_added
      t.integer :release_year
      t.float :rating
      t.string :duration
      t.references :type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
