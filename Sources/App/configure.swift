import Vapor
import Leaf

public func configure(_ app: Application) async throws {
    // 1. Static files (CSS/JS)
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    // 2. Setup Leaf
    app.views.use(.leaf)

    // 3. Register routes
    try routes(app)
}
