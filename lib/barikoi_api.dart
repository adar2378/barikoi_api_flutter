class BarikoiApi {
  final String apiKey;
  final String baseurl = "https://barikoi.xyz/v1/api/search/";
  String reveseGeocoding;
  String geoCode;
  String autoComplete;
  String nearBy;
  String distance;
  BarikoiApi({this.apiKey}) {
    reveseGeocoding = "reverse/geocode/$apiKey/place";
    geoCode = "geocode/$apiKey/place/";
    autoComplete = "autocomplete/$apiKey/place";
    nearBy = "nearby/$apiKey/0.5/10";
    distance = "distance/$apiKey/";
  }

  
}
