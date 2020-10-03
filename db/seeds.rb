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
type = Type.create(name: "Show")

###############################################
# Generate Genres table
genre = Genre.create(name: "Action")

###############################################
# Generate Directors table
director = Director.create(name: "J.J. Abrams")

###############################################
# Generate Actors table
actor = Actor.create(name: "Will Smith")

###############################################
# Generate NetflixTitles table
netflix = type.netflix_titles.create(
  title:        "The Boys",
  description:  "The Boys from Amazon",
  date_added:   Date.today,
  release_year: 2020,
  rating:       "R",
  duration:     "45 min"
)

###############################################
# Generate Movies table
movie = Movie.create(
  title:        "LOTR",
  description:  "LOTR full movie",
  release_date: Date.today,
  release_year: 2020,
  duration:     190,
  average_vote: 4.5,
  votes:        1350
)

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
