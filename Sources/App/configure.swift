import Vapor
import Leaf

public func configure(_ app: Application) async throws {
    
    if let portString = Environment.get("PORT"), let port = Int(portString) {
        app.http.server.configuration.port = port
    }
    
    app.http.server.configuration.hostname = "0.0.0.0"
    
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.views.use(.leaf)
    
    try routes(app)
}
