trigger ContactRollUpSummaryTrigger on Contact (after insert, after update, after delete, after undelete) {
    if (Trigger.isAfter) {
        if(Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete){
            ContactHandler.contactsOnAccount(Trigger.new, Trigger.oldMap);
        }
        if(Trigger.isDelete){
            ContactHandler.contactsOnAccountDelete(Trigger.old);
        }
    }
}