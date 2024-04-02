public with sharing class AccountController {
  @AuraEnabled(cacheable=true)
  public static void changeName(String name, Id accountId) {
    Account account = [SELECT Id, Name FROM Account WHERE Id = :accountId];
    account.Name = name;
    update account;
  }
  @AuraEnabled(cacheable=true)
  public static List<Account> getAccounts() {
    return [SELECT Id, Name FROM Account Limit 5];
  }
}