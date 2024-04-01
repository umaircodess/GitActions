public class ContactSearch {
    public static List<Contact> searchForContacts(String lname, String mpcode){
List<Contact> conn = [Select Name from Contact where LastName = 'Umair' AND MailingPostalCode = :mpcode];

return conn;

    }

}