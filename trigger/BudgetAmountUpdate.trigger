trigger BudgetAmountUpdate on Contact (before insert, after insert, before delete, after delete) {
	
    //public List<Contact> contactList_AfterInsert = new List<Contact>();
    IF(Trigger.isInsert && Trigger.isAfter)
    {
        //List<Contact> contactList_AfterInsert = new List<Contact>();
        BudgetAmountUpdate_Helper.BudgetAmountUpdate_Insertion(Trigger.new);
    }
    
     IF(Trigger.isDelete && Trigger.isAfter)
    {
        //List<Contact> contactList_AfterInsert = new List<Contact>();
        BudgetAmountUpdate_Helper.BudgetAmountUpdate_Insertion(Trigger.old);
        //BudgetAmountUpdate_Helper.BudgetAmountUpdate_Deletion(Trigger.old);
    }
}