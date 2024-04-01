global class BatchPractice implements Database.Batchable<SObject> {

    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([Select Id from Account]);
    }

    global void execute(Database.BatchableContext bc, List<Account> listofaccouts){

    }

    global void finish(Database.BatchableContext bc){

    }

}