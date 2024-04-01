@isTest
public class RUNTESTT {
    @isTest
    static void testSquare() {
        Integer input = 5;
        Integer expectedOutput = 25;
        Integer actualOutput = RUNTEST.square(input);
        System.assertEquals(expectedOutput, actualOutput, 'Square calculation is incorrect');
    }
}
