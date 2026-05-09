//
//  File.swift
//  HeavyHitters
//
//  Created by Tensae on 09/05/2026.
//

import Vapor
import Leaf

struct DashboardController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get(use: renderDashboard)
        routes.post("toggle", ":id", use: handleToggle)
    }
    
    func renderDashboard(req: Request) async throws -> View {
        let bags = await BagStore.shared.getAll()
        return try await req.view.render("dashboard", ["bags": bags])
    }
    
    func handleToggle(req: Request) async throws -> Response {
        guard let id = req.parameters.get("id", as: Int.self) else {
            throw Abort(.badRequest)
        }
        await BagStore.shared.toggle(id: id)
        return req.redirect(to: "/")
    }
}
