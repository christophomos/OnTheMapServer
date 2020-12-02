import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    app.get("hello", ":name") { req -> String in
        guard let name = req.parameters.get("name") else {
            throw Abort(.internalServerError)
        }
        return "Hello, \(name)!"
    }
    
    app.post("info") { req -> InfoResponse in
        let data = try req.content.decode(InfoData.self)
        return InfoResponse(superheroName: "Super\(data.name)")
    }
    
    app.get("v1", "StudentLocation") { req -> StudentLocationResults in
        return StudentLocationResults.sampleValue
    }
    
    // 1
    app.post("v1", "StudentLocation") { req -> EventLoopFuture<StudentLocation> in
      // 2
      let studentLocation = try req.content.decode(StudentLocation.self)
        let studentLocationModel = StudentLocationModel(studentLocation: studentLocation)
      // 3
      return studentLocationModel.save(on: req.db).map {
        // 4
        StudentLocation(studentLocationModel: studentLocationModel)
      }
    }
}

struct InfoData: Content {
    let name: String
}

struct InfoResponse: Content {
    let superheroName: String
}
