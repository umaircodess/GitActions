public with sharing class batchTheoryTest implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext context) {
        String query1 = 'SELECT Id FROM Account';
        return Database.getQueryLocator(query1);
    }

    public void execute(Database.BatchableContext context, List<SObject> scope){
        for(SObject bj: scope) 
        System.debug(bj);  
    }

    public void finish (Database.BatchableContext context){
        System.debug('Done');
    }
}