trigger beforeContactCreation on Contact (before insert, after insert) {

    //calling the handler on isInsert and isAfter context of Trigger
    if(trigger.isInsert && trigger.isAfter)
    {   
        beforeContactCreation_Handler.checkContacts(trigger.new);
    }

}