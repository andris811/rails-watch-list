# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'json'
require 'open-uri'

page_number = 0

# loop do
#   page_number += 1
#   url = "http://tmdb.lewagon.com/movie/top_rated?&page=#{page_number}"
#   movies = URI.open(url).read
#   movie = JSON.parse(movies)
#   movie_results = movie['results']
#   movie_poster = 'https://image.tmdb.org/t/p/w500'

#   movie_results.each do |m|
#     new_movie = Movie.create(title: m['title'], overview: m['overview'], poster_url: movie_poster + m['poster_path'], rating: m['vote_average'])
#     puts "#{new_movie.title} has been created!"
#   end

#   if page_number == 4
#     break
#   end
# end

# puts Movie.count.to_s


loop do
  page_number += 1
  url = "https://api.themoviedb.org/3/movie/top_rated?api_key=07e667cc1b870e061cc8f53f2559c0d7&language=en-US&page=#{page_number}"
  movies = URI.open(url).read
  movie = JSON.parse(movies)
  movie_results = movie['results']
  movie_poster = 'https://image.tmdb.org/t/p/w500'

  movie_results.each do |m|
    new_movie = Movie.create(title: m['title'], overview: m['overview'], poster_url: movie_poster + m['poster_path'], rating: m['vote_average'])
    puts "#{new_movie.title} has been created!"
  end

  if page_number == 4
    break
  end
end

puts Movie.count.to_s
