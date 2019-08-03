# barikoi

A dart package for barikoi API. Barikoi is a Bangladeshi local data provider about places. Their API Helps us to find address, geocode and reverse geocode place in Dhaka in our local context.

## Usage

Creating the instance:
``` Dart
BarikoiApi api = BarikoiApi(apiKey: <API_KEY>);
```
API_KEY can be obtained from https://barikoi.com/home

### Supported API methods
- Reverse GeoCoding
- GeoCoding
- Distance
- Nearby
- Auto-complete

__Reverse GeoCoding__

It takes 2 inputs, lat and lon. Short for latitude and longitude. Both has to be string. It will return a list of PlaceRCG. Which will contain the locations from that lat-lon.
``` Dart
await api.reverseGeoCoding(lat: "23.7833522", lon: "93.4248978")
```

__GeoCoding__

It takes a string which is the placeId of the location. You can directly access the details of a place using it's id. It will return an object which will contain all the information regarding that place.
``` Dart
await api.geoCoding(placeId: "5")
```

__Nearby__

It takes 2 inputs, lat and lon. Short for latitude and longitude. Both has to be string. Will return all the places nearby that coordinate in a list of PlaceNearby object.
``` Dart
await api.nearby(lat: "23.7833522", lon: "90.4248978");
```

__AutoComplete__

It takes a string, basically the query which the user want to search for. Then it will return a list of suggested places based on that query string.
``` Dart
await api.autoComplete(query: "barikoi")
```
__Distance__

It takes the coordinate of the source and target then returns a string which contains the distance.
``` Dart
await api.distance(
                      sourceLatitude: "90.4178546",
                      sourceLongitude: "23.7619058",
                      targetLatitude: "90.4178546",
                      targetLongitude: "23.5619058");
```

### Exceptions
- NotFoundException (If the data was empty)
- OutSideDhakaException (If the coordinate is out of Dhaka)
- LimitExceededException (If the limit of api calls is over) 
- TimeoutException (If the api call takes more than 15 seconds to complete)
