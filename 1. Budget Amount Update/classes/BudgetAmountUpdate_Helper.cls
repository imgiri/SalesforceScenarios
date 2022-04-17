global class BudgetAmountUpdate_Helper {
    
    global static void BudgetAmountUpdate_Insertion(List<Contact> contactList){
        
        SET<ID> accIds = new SET<ID>();
        LIST<Contact> relatedContacts = new LIST<Contact>();
        LIST<Contact> relatedContacts_Update = new LIST<Contact>();
        MAP<Id, Integer> accContactMap = new MAP <Id, Integer>();
        MAP<Id, Decimal> accTotalBudgetedAmountMap = new MAP<Id, Decimal>();
        
        for(Contact c : contactList)
        {
            accIds.add(c.AccountId);
        }
        
        relatedContacts = [SELECT Id, AccountId, Budget_Amount__c, Account.Total_Budgeted_Amount__c FROM Contact WHERE AccountID IN:accIds];
        
        for(contact c : relatedContacts)
        {
            IF(!(accTotalBudgetedAmountMap.containskey(c.AccountId)))
            {
                accTotalBudgetedAmountMap.put(c.AccountId, c.Account.Total_Budgeted_Amount__c);
            }
            
            
            IF(!(accContactMap.containskey(c.AccountId)))
            {
                accContactMap.put(c.AccountId, 1);
            }
            
            ELSE
            {
                accContactMap.put(c.AccountId, accContactMap.get(c.AccountId) + 1);
            }
            
        }
        
        for(Contact c : relatedContacts)
        {
            c.Budget_Amount__c = accTotalBudgetedAmountMap.get(c.AccountId) / (accContactMap.get(c.AccountId) );
            relatedContacts_Update.add(c);
        }
        
    UPDATE relatedContacts_Update;
        
	}
    
    /*global static void BudgetAmountUpdate_Deletion(List<Contact> contactList){
        
        SET<ID> accIds = new SET<ID>();
        LIST<Contact> relatedContacts = new LIST<Contact>();
        LIST<Contact> relatedContacts_Update = new LIST<Contact>();
        MAP<Id, Integer> accContactMap = new MAP <Id, Integer>();
        MAP<Id, Decimal> accTotalBudgetedAmountMap = new MAP<Id, Decimal>();
        
        
        
    }*/
    
             
}
