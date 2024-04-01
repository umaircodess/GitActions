public with sharing class AnimalLocator {
    public static String getAnimalNameById(Integer Id) {

HttpRequest request = new HttpRequest();
request.setMethod('GET');
request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+Id);

HttpResponse response = new Http().send(request);
OuterAnimal anymal= (OuterAnimal) OuterAnimal.parse(response.getBody());
return  anymal.animal.name;
}


}