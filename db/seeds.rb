# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
require 'json'

url = 'https://tmdb.lewagon.com/movie/top_rated?'

api_data = JSON.parse(URI.open(url).read)

api_data['results'].each do |item|
  Movie.create(
    title: item['title'],
    overview: item['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{item['poster_path']}",
    rating: item['vote_average']
    )
end
