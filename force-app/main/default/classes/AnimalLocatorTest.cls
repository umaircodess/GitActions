@isTest
public class AnimalLocatorTest  {
    @isTest
    static void TestAnimalLocator(){
         Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
         Test.startTest();
         String name = AnimalLocator.getAnimalNameById(1);
         Test.stopTest();

        System.assertEquals('chicken', name);


    }

}