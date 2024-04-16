import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    //Post
    app.post("movies") { req async throws in
        let movie = try req.content.decode(Movie.self)
        return movie
    }
    
    app.get("customers", ":customerId") { req async throws -> String in
        guard let customerId = req.parameters.get("customerId", as: Int.self) else {
            throw Abort(.badRequest)
        }
        return " \(customerId)"
    }
    
    
    //movies/action
    app.get("movies", "action") { req async -> String in
        "Movies of action"
    }
    
    // /movies
    app.get("movies") { req async in
     [
        Movie(title: "Batman", year: 2012),
        Movie(title: "Wolf of WallStreet", year: 2020),
        Movie(title: "Barbie", year: 2024),
        Movie(title: "SpiderMan", year: 2004)
     ]
    }
    
    // route parameters/dynamic parameters
    /// http://127.0.0.1:8080/movies/drama
    
    app.get("movies", ":genre") { req async  throws -> String in
        guard let genre = req.parameters.get("genre") else {
            throw Abort(.badRequest)
        }
        return "All movies of genre: \(genre)"
    }
    
    // /movies/action/2024
    app.get("movies", ":genre", ":year") { req async  throws -> String in
        guard let genre = req.parameters.get("genre"),
        let year = req.parameters.get("year") else {
            throw Abort(.badRequest)
        }
        return "All movies of genre: \(genre) for year \(year)"
    }
}
