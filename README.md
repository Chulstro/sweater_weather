## Sweater Weather
  
Sweater Weather is the final solo project for Turing School's Mod 3. This point of the project was to be able to recieve a wireframe from a frontend team and be able to format API data in order to give them useful and workable data.

### Learning Goals: 

- refactoring
- serializers
- consuming APIs
- exposing APIs
- authentication
- password encryption

### Built with:

- Rails: 5.2.4
- Ruby: 2.5.1
- PostgreSQL: 12.2
- Bcrypt for authentication

***Testing framework***
- RSpec
- Capybara
- Simplecov
- Shoulda-matchers

### Installation

1. Clone the repo
```sh
git clone git@github.com:Chulstro/sweater_weather.git
```
2. Bundle your Gem File
```sh
bundle install
```
3. Create your environment
```sh
rails db:create
rails db:migrate
```
4. Install Secret file using Figaro
```sh
figaro install
```
5. Visit the Mapquest API, OpenWeather and Pixabay sitea to retrieve your API keys. The keys must be stored locally using the application.yml file figaro created.

```sh
GEOCODING_KEY: <YOUR_MAPQUEST_KEY>

OPENWEATHER_KEY: <YOUR_OPEN_WEATHER_KEY>

PIXABAY_KEY: <YOUR_PIXABAY_KEY>
```

## Sweater Weather Endpoints

Retrieve a background picture for a specific location:
```sh
GET api/v1/backgrounds?location=<location_name_here>
```
Expected response: 
```sh
{
    "data": {
        "id": 23723,
        "type": "background",
        "attributes": {
            "url": "image_link_here"
        }
    }
}
```
Retrieve weather forecast for a specific location:
```sh
GET api/v1/forecast?location=<location_name>
```

Register a new user providing an email and password information:
```sh
POST api/v1/users
```

Retrieve an existing user provided the correct information is sent:
```sh
POST /api/v1/sessions
```

Returns road trip information for a registered user when given to locations and an api_key:
```
POST api/v1/road_trip
```
