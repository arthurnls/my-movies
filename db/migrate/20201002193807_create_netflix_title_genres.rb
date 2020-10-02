class CreateNetflixTitleGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :netflix_title_genres do |t|
      t.references :netflix_title, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
