struct WeatherResponse : Codable {
    let temperature: Int
    let feeling: String
}

func GetWeather() -> WeatherResponse {
    let temp = Int.random(in: -40...50)
    let f = switch temp {
        //Unlike Rust cannot specify "everything below -30"
        case (-40..<(-30)): "Extremely cold"
        case (-30..<(-10)): "Freezing"
        case (-10..<5): "Cold"
        case (5..<15): "Chilly"
        case (15..<25): "Warm"
        case (25..<35): "Hot"
        case (35...50): "Scorching"
        default: "Unknown"
    }

    let w = WeatherResponse(temperature: temp, feeling: f)
    return w
}