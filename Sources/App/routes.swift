import Vapor

func routes(_ app: Application) throws {
    // Register the controller only ONCE here
    try app.register(collection: DashboardController())
}
