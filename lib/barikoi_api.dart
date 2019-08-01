class BarikoiApi {
  final String apiKey;
  final String baseurl = "https://barikoi.xyz/v1/api/search/";
  String reveseGeocoding;
  BarikoiApi(this.apiKey) {
    reveseGeocoding = "reverse/geocode/$apiKey/place";
  }
}
