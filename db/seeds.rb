require "csv"

ActiveRecord::Base.connection.disable_referential_integrity do
  Movie.destroy_all
  NetflixTitle.destroy_all
  User.destroy_all
  Type.destroy_all
  Genre.destroy_all
  Director.destroy_all
  Actor.destroy_all
end

TOTAL_USERS = 20

###############################################
# Generate Types table
# types is created while looping through netflix_titles

###############################################
# Generate Genres table
# genres is created while looping through movies and netflix_titles

###############################################
# Generate Directors table
# directors is created while looping through movies and netflix_titles

###############################################
# Generate Actors table
# actors is created while looping through movies and netflix_titles

###############################################
###############################################
# Generate Movies table

# csv_file = Rails.root.join("db/netflix_titles.csv")
csv_file = Rails.root.join("db/IMDB movies.csv")
csv_data = File.read(csv_file)

movies = CSV.parse(csv_data, headers: true)

movies.each do |movie|
  release_year = movie["year"].to_i
  average_vote = movie["avg_vote"].to_f
  next if release_year < 1970
  next if average_vote < 8.0
  next if !movie["language"].nil? && (movie["language"].include? "English")
  next if !movie["country"].nil? && (movie["country"].include? "India")

  # individual movie data
  title = movie["original_title"]
  duration = movie["duration"].to_i
  votes = movie["votes"].to_i
  # Description might be null. Assign title as the description
  description = movie["description"].nil? ? title : movie["description"]
  # date_published might have an invalid format. When that happens use the release year
  begin
    release_date = movie["date_published"].to_date
  rescue StandardError
    next
  end

  # create movie
  created_movie = Movie.create(
    title:        title,
    description:  description,
    release_date: release_date, # Date
    release_year: release_year, # integer
    duration:     duration, # integer
    average_vote: average_vote, # float
    votes:        votes # integer
  )

  # shared movie data
  # Genres
  genres = movie["genre"].split(",")
  genres.each do |gen|
    created_genre = Genre.find_or_create_by(name: gen.strip)
    MovieGenre.create(genre: created_genre, movie: created_movie)
  end

  # Directors
  unless movie["director"].nil?
    directors = movie["director"].split(",")
    directors.each do |dir|
      created_director = Director.find_or_create_by(name: dir.strip)
      MovieDirector.create(director: created_director, movie: created_movie)
    end
  end

  # Actors
  next if movie["actors"].nil?

  actors_counter = 0
  actors = movie["actors"].split(",")
  actors.each do |act|
    break if actors_counter == 3

    created_actor = Actor.find_or_create_by(name: act.strip)
    MovieActor.create(actor: created_actor, movie: created_movie)
    actors_counter += 1
  end
end

###############################################
###############################################
# Generate NetflixTitles table

require "csv"
csv_file = Rails.root.join("db/netflix_titles.csv")
csv_data = File.read(csv_file)

netflix_titles = CSV.parse(csv_data, headers: true)

netflix_titles.each do |netflix_title|
  # Get TV Shows only for 4 or more seasons
  # Get Movies only for 120 minutes or more
  created_type = Type.find_or_create_by(name: netflix_title["type"])
  duration = netflix_title["duration"]
  next if netflix_title["country"].nil?
  next if !netflix_title["country"].nil? && (netflix_title["country"].include? "India")

  if duration.include? "Season"
    dur = duration
    dur.slice! " Season"
    next if dur.strip.to_i < 4
  else
    dur = duration
    dur.slice! " min"
    next if dur.strip.to_i < 120
  end

  title = netflix_title["title"]
  country = netflix_title["country"]
  release_year = netflix_title["release_year"].to_i

  # date_added might have an invalid format. When that happens use the release year
  begin
    date_added = netflix_title["date_added"].to_date
  rescue StandardError
    date_added = Date.new(release_year, 1, 1)
  end

  rating = netflix_title["rating"].nil? ? "NR" : netflix_title["rating"]
  description = netflix_title["description"]

  created_netflix_title = created_type.netflix_titles.create(
    title:        title,
    description:  description,
    date_added:   date_added,
    release_year: release_year,
    rating:       rating,
    duration:     duration
  )

  # shared netflix_titles data
  # Genres
  genres = netflix_title["listed_in"].split(",")
  genres.each do |gen|
    created_genre = Genre.find_or_create_by(name: gen.strip)
    NetflixTitleGenre.create(genre: created_genre, netflix_title: created_netflix_title)
  end

  # Directors
  unless netflix_title["director"].nil?
    directors = netflix_title["director"].split(",")
    directors.each do |dir|
      created_director = Director.find_or_create_by(name: dir.strip)
      NetflixTitleDirector.create(director: created_director, netflix_title: created_netflix_title)
    end
  end

  # Actors
  next if netflix_title["cast"].nil?

  actors_counter = 0
  actors = netflix_title["cast"].split(",")
  actors.each do |act|
    break if actors_counter == 3

    created_actor = Actor.find_or_create_by(name: act.strip)
    NetflixTitleActor.create(actor: created_actor, netflix_title: created_netflix_title)
    actors_counter += 1
  end
end

###############################################
###############################################
# Generate users table

TOTAL_USERS.times do
  user_name = Faker::Name.unique.name
  user_age = Faker::Number.within(range: 15..80)
  user = User.create(name: user_name, age: user_age)
  user.netflix_titles << NetflixTitle.first
  user.movies << Movie.first
end

###############################################
# Output checking data
puts "================================="
puts "================================="
puts Type.first.inspect
puts Genre.first.inspect
puts Director.first.inspect
puts Actor.first.inspect
puts User.first.inspect
puts NetflixTitle.first.inspect
puts Movie.first.inspect
puts "================================="
puts "Created #{Type.count} Types"
puts "Created #{Genre.count} Genres"
puts "Created #{Director.count} Directors"
puts "Created #{Actor.count} Actors"
puts "Created #{User.count} Users"
puts "Created #{NetflixTitle.count} Netflix Titles"
puts "Created #{Movie.count} Movies"
