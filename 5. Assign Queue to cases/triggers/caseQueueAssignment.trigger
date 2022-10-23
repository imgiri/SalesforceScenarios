trigger caseQueueAssignment on Case (before insert, before update) {

    //calling the handler on isInsert and isBefore context of Trigger
    if(trigger.isInsert && trigger.isBefore)
    {   
        caseQueueAssignment_Handler.queueAssignmentonInsert(trigger.new);
    }

    //calling the handler on isUpdate and isBefore context of Trigger
    if(trigger.isUpdate && trigger.isBefore)
    {   
        caseQueueAssignment_Handler.queueAssignmentonUpdate(trigger.old , trigger.new);
    }


}