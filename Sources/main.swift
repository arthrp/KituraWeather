import Kitura
import Foundation

let router = Router()

router.get("/") { request, response, next in
    let w = GetWeather()
    let jsonData = try JSONEncoder().encode(w)

    response.headers.append("Content-Type", value: "application/json")
    response.send(data: jsonData).status(.OK)
    next()
}

Kitura.addHTTPServer(onPort: 8080, with: router)
Kitura.run()