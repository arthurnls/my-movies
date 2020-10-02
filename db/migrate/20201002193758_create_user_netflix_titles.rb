class CreateUserNetflixTitles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_netflix_titles do |t|
      t.references :user, null: false, foreign_key: true
      t.references :netflix_title, null: false, foreign_key: true

      t.timestamps
    end
  end
end
