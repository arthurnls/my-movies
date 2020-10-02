class CreateNetflixTitleActors < ActiveRecord::Migration[6.0]
  def change
    create_table :netflix_title_actors do |t|
      t.references :netflix_title, null: false, foreign_key: true
      t.references :actor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
