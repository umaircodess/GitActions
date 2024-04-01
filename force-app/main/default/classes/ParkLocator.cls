public with sharing class ParkLocator {
    public static List<String> country(String theCountry) {

        ParkService.ParksImplPort parks = new ParkService.ParksImplPort();

        List<String> parknames = parks.byCountry(theCountry);

        return parknames;

    }
}