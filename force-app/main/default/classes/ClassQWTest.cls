@isTest
public with sharing class ClassQWTest {
@isTest
    static void testSquare() {
        Integer input = 5;
        Integer expectedOutput = 25;
        Integer actualOutput = ClassQW.square(input);
        System.assertEquals(expectedOutput, actualOutput, 'Square calculation is incorrect');
    }
}