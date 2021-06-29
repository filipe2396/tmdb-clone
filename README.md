# Requirements
- Ruby 3.0.1
- PostgreSQL
- NodeJS
- yarn
- foreman

# Running the application
Create an `.env` file with the following content
```
TMDB_API_KEY=<your_api_key>
```
Run the setup script and start the server
```
bin/setup
foreman start -f Procfile.dev
```

# Running tests
```
bundle exec rspec
```
