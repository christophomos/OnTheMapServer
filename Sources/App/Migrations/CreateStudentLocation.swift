import Fluent

struct CreateStudentLocation: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        
        database.schema(StudentLocationModel.schema)
            .id()
            .field("created_at", .string, .required)
            .field("first_name", .string, .required)
            .field("last_name", .string, .required)
            .field("latitude", .double, .required)
            .field("longitude", .double, .required)
            .field("map_string", .string, .required)
            .field("media_url", .string, .required)
            .field("unique_key", .string, .required)
            .field("updated_at", .string, .required)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema(StudentLocationModel.schema).delete()
    }
}
