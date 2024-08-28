import Cocoa

// Create an array of strings, then write some code that prints the number of items in the array and also the number of unique items in the array.

let movies = ["Avatar","The Godfather","Harry Potter","Star Wars","The Godfather","Avatar"]

var count = 0

for movie in movies {
    print(movie)
    count += 1
}

print("The number of item is \(count)")

count = 0

let setMovies = Set(movies)

for setMovie in setMovies {
    print(setMovie)
    count += 1
}

print("The number of unique item is \(count)")

