class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.integer :tmdb_id, null: false
      t.string :title, null: false
      t.date :release_date
      t.text :overview
      t.string :poster_path
      t.float :vote_average
      t.integer :vote_count

      t.index :tmdb_id, unique: true

      t.timestamps
    end
  end
end
