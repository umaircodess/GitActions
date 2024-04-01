public with sharing class AddPrimaryContact implements Queueable {
   private Contact contact;
   private String stateabbreviation;

   public AddPrimaryContact(Contact contact, String stateabbreviation){
    this.contact = contact;
    this.stateabbreviation = stateabbreviation;
   }
   public void execute(QueueableContext qc){
    List<Account> listofaccounts = [SELECT ID from Account where BillingState = :stateabbreviation];
    List<Contact> toaddcontacts = new List<Contact>();
    for(Account eachaccount : listofaccounts ){
        Contact newcontact = contact.clone();
        newcontact.AccountId = eachaccount.Id;
        toaddcontacts.add(newcontact);
    }
    insert toaddcontacts;
   }
}