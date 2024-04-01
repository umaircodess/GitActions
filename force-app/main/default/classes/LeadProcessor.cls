public with sharing class LeadProcessor implements Database.Batchable<SObject> {
    public Database.QueryLocator start(Database.BatchableContext context){
        return Database.getQueryLocator([Select Id, LeadSource from Lead]);
    }
    public void execute(Database.BatchableContext context, List<Lead> listofleads){
        for(Lead everylead : listofleads){
            everylead.LeadSource= 'Dreamforce';
        }
        update listofleads;
    }

    public void finish(Database.BatchableContext context){

    }
}