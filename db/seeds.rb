Type.destroy_all
Genre.destroy_all
Director.destroy_all
Actor.destroy_all

type = Type.create(name: "Show")
genre = Genre.create(name: "Action")
director = Director.create(name: "J.J. Abrams")
actor = Actor.create(name: "Will Smith")

user = User.create(name: "Dante Saraiva", age: 15)

# rails g model Type name:string
# rails g model Genre name:string
# rails g model Director name:string
# rails g model Actor name:string
# rails g model User name:string age:string
# rails g model NetflixTitle title:string description:text date_added:date release_year:integer rating:string duration:string type:references
# rails g model Movie title:string description:text release_date:date release_year:integer duration:integer average_vote:float votes:integer
