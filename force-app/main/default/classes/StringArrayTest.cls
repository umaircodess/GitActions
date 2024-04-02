public class StringArrayTest {
    public static List<String> generateStringArray(Integer input) {
        List<String> result = new List<String>();
        
        for (Integer i = 0; i < input; i++) {
            result.add('Test ' + i);
        }
        
        return result;
    }
}