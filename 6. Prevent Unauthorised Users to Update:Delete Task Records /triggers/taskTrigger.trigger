trigger taskTrigger on Task (before update, before delete) {
	
    //calling the handler on isUpdate and isBefore context of Trigger
    if(trigger.isUpdate && trigger.isBefore)
    {   
        taskTrigger_Handler.preventTaskUpdation(trigger.new);
    }
    
    //calling the handler on isDelete and isBefore context of Trigger
    if(trigger.isDelete && trigger.isBefore)
    {   
        taskTrigger_Handler.preventTaskDeletion(trigger.old);
    }
    
}