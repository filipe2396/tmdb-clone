# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Movie.any?
  Movie.create(
    tmdb_id: 299_534,
    title: 'Vingadores: Ultimato',
    release_date: '2019-04-23',
    overview: 'Após os eventos devastadores de \"Vingadores: Guerra Infinita\", o universo está em ruínas devido aos esforços do Titã Louco, Thanos. Com a ajuda de aliados remanescentes, os Vingadores devem se reunir mais uma vez a fim de desfazer as ações de Thanos e restaurar a ordem no universo de uma vez por todas, não importando as consequências.',
    poster_path: '/q6725aR8Zs4IwGMXzZT8aC8lh41.jpg',
    vote_average: 8.3,
    vote_count: 18_409
  )
end
