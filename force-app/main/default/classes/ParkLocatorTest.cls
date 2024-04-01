@isTest
public with sharing class ParkLocatorTest {
@isTest
 static void testSOAP(){
    Test.setMock(WebServiceMock.class, new ParkServiceMock());

    String country = 'Pakistan';
    
    List<String> parks = new List<String>{'Park1', 'Park2', 'Park3'};

    Test.startTest();
    List<String> result = ParkLocator.country(country);
    Test.stopTest();

    System.assertEquals(parks, result);


 } 
}