public with sharing class CatAPICallout {

    public static CatAPIResponse catbreeds(){

HttpRequest request = new HttpRequest();
request.setMethod('GET');
request.setEndpoint('https://catfact.ninja/breeds');

HttpResponse response = new Http().send(request);

CatAPIResponse breedss = CatAPIResponse.parse(response.getBody());
return breedss ;

}
}