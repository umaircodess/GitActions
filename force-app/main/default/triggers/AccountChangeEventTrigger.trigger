trigger AccountChangeEventTrigger on AccountChangeEvent (after insert) {
    List<Account> accountsToUpdate = new List<Account>();
    
    for (AccountChangeEvent event : Trigger.new) {
        // if (event.ChangeEventHeader.getChangeType() == 'UPDATE') {
            Account acc = new Account(
                Id = event.ChangeEventHeader.getRecordIds()[0],
                Name = 'Change Data Capture'
            );
            accountsToUpdate.add(acc);
        // }
    }
    if (!accountsToUpdate.isEmpty()) {
        update accountsToUpdate;
    }
}
