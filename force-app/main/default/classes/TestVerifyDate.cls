@isTest
public with sharing class TestVerifyDate {
    @isTest static void testCheckDates() {
        Date endofmonth = VerifyDate.CheckDates(Date.newInstance(2024, 12, 30), Date.newInstance(2025, 12, 31));
        System.assertEquals(Date.newInstance(2024, 12, 31), endofmonth);
        

        Date usedate2 = VerifyDate.CheckDates(Date.newInstance(2024, 12, 31), Date.newInstance(2025, 01, 01));
        System.assertEquals(Date.newInstance(2025, 01, 01), usedate2);

    }

        @isTest static void testDateWithin30Days() {
        
        Boolean false1=VerifyDate.DateWithin30Days(Date.newInstance(2024, 12, 31), Date.newInstance(2023, 12, 31));
        System.assertEquals(false, false1);


        Boolean false2=VerifyDate.DateWithin30Days(Date.newInstance(2024, 12, 31), Date.newInstance(2025, 12, 31));
        System.assertEquals(false, false2);

        Boolean true1=VerifyDate.DateWithin30Days(Date.newInstance(2024, 12, 31), Date.newInstance(2025, 01, 01));
        System.assertEquals(true, true1);
    }

        @isTest static void testSetEndOfMonthDate() {

        Date setendofmonth = VerifyDate.SetEndOfMonthDate(Date.newInstance(2024, 12, 30));
        System.assertEquals(Date.newInstance(2024, 12, 31), setendofmonth);
    }
}