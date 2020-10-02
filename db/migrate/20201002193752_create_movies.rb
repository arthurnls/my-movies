class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.date :release_date
      t.integer :release_year
      t.integer :duration
      t.integer :average_vote
      t.integer :votes

      t.timestamps
    end
  end
end
