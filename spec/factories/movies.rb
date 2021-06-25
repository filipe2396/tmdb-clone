FactoryBot.define do
  factory :movie do
    tmdb_id { rand(0..100_000) }
    title { 'Batman' }
  end
end
