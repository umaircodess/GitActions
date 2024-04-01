public class TriggerHandler {
    public static void beforeinsert(List<Account> accounts){
        for(Account account: accounts)
            account.Description = 'Triggers at work';
    }
    public static void afterinsert(List<Account> newlist){
        // List<Opportunity> opportunities = new List<Opportunity>();
        // for(Account parentaccount : newlist){
            
        // Opportunity relatedopportunity = new Opportunity();
        // relatedopportunity.name=parentaccount.name;
        // relatedopportunity.AccountId=parentaccount.Id;
        // relatedopportunity.CloseDate=System.Today();
        // relatedopportunity.StageName='Prospecting';
        // opportunities.add(relatedopportunity);
        // }
        // if(!opportunities.isEmpty()){
        //     insert opportunities;        
        // }
        
    }
    public static void beforeupdate(List<Account> updateddata, Map<Id, Account> oldAccounts ){

        for(Account eachaccount : updateddata)
        if(eachaccount.Phone!= oldAccounts.get(eachaccount.Id).Phone)
        eachaccount.Description='Phone number modified';
    }

    public static void afterupdate(List<Account> updatedaccounts, Map<Id, Account> oldaccounts ){




      //  List<Account> accountswithchangedphone = new List<Account>();
      Set<Id> accountIds = new Set<Id>();
        for(Account eachaccount : updatedaccounts){
            if(eachaccount.Phone!= oldAccounts.get(eachaccount.Id).Phone){
                accountIds.add(eachaccount.Id);
            }
        }

    //    List<Opportunity> relatedopportunities =[Select Id,Phone__c from Opportunity where AccountId in :accountswithchangedphone];

List<Opportunity> listofopportunitiestoupdate = new List<Opportunity>();

        List<Account> accountswithopportunities = [Select Id, Phone, (Select id, Phone__c from Opportunities) from Account where Id IN :accountIds];
        for(Account eachaccountwithopportunity : accountswithopportunities){
           List<Opportunity> relatedopportunities =  eachaccountwithopportunity.Opportunities;
           for(Opportunity eachopportunity : relatedopportunities){
            eachopportunity.Phone__c = eachaccountwithopportunity.Phone;

           }

           listofopportunitiestoupdate.addall(relatedopportunities);

           
     }
     update listofopportunitiestoupdate;

    }
    // }



        // for(Account eachaccount : updatedaccounts){
        // if(eachaccount.Phone!= oldAccounts.get(eachaccount.Id).Phone){
    //         List<Opportunity> relatedopportunities = [Select ID, Phone__c from Opportunity where AccountId = :eachaccount.Id];
    //         for(Opportunity eachopportunity : relatedopportunities){
    //         eachopportunity.Phone__c = eachaccount.Phone;
    //         }

    //         update relatedopportunities;
    //     }
     //}  

    public static void beforedelete(List<Account> databeforedeletion ){
        // List<Opportunity> relatedopportunities = [Select AccountId from Opportunity where AccountId IN :databeforedeletion];

        //         for(Account eachaccount: databeforedeletion){
        //             for(Opportunity anyopportunity : relatedopportunities){
        //                 if(eachaccount.id == anyopportunity.AccountId){
        //                     eachaccount.addError('Account has related opportunities and therefore cannot be deleted');
        //     }

        // }    
 //   }
        // for(Account eachaccount: databeforedeletion){
        //     List<Opportunity> relatedopportunities = [Select ID from Opportunity where AccountId = :eachaccount.Id]; 
        //     if(!relatedopportunities.isEmpty()){
        //         eachaccount.addError('Account has related opportunities and therefore cannot be deleted');
        //     }
        // }

        
}

    public static void afterdelete(List<Account> deletedaccounts ){

        // for( Account eachdeletedaccount : deletedaccounts){
        //     List<Opportunity> relatedopportunities = [Select ID, Phone__c from Opportunity where AccountId = :eachdeletedaccount.Id];
        //     delete relatedopportunities;
        // }
        




        }

         


}