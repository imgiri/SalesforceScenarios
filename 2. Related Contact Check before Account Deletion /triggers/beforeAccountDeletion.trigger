trigger beforeAccountDeletion on Account(before delete) 
{

    if(trigger.isDelete && trigger.isBefore)
    {
        beforeAccountDeletion_Handler.checkContacts(trigger.old);
    }


}