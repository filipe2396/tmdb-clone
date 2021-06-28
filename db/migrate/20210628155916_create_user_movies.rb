class CreateUserMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :user_movies do |t|
      t.references :user, foreign_key: true, null: false
      t.references :movie, foreign_key: true, null: false

      t.timestamps
    end
  end
end
