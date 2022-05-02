public with sharing class ContactHandler {
    
    public static void contactsOnAccount(List<Contact> contacts, Map<Id, Contact> oldContacts){
        Set<Id> accountIds = new Set<Id>();
        for(Contact objCon : contacts){
            system.debug('oldContacts '+oldContacts);
            if(objCon.AccountId != null){
                accountIds.add(objCon.AccountId);
            }
            if(oldContacts!=null){
                 if(oldContacts.get(objCon.Id).AccountId != null ||
					objCon.AccountId != oldContacts.get(objCon.Id).AccountId){
                    accountIds.add(oldContacts.get(objCon.Id).AccountId);
                }
            }
        }
        if(!accountIds.isEmpty()){
            rollUpContacts(accountIds);
        }
    }

    public static void contactsOnAccountDelete(List<Contact> contacts){
        Set<Id> accountIds = new Set<Id>();
        for(Contact objCon : contacts){
            if(objCon.AccountId != null){
                accountIds.add(objCon.AccountId);
            }
        }
        if(!accountIds.isEmpty()){
            rollUpContacts(accountIds);
        }
    }
    
    public static void rollUpContacts(Set<Id> accountIds){
        List<Account> accList = [SELECT Id, Number_Of_Contacts__c, (SELECT Id FROM Contacts) 
                                   FROM Account WHERE Id IN : accountIds ];
        if(!accList.isEmpty()){
            List<Account> accountsToBeUpdated = new List<Account>();
            for(Account acc:accList){
                Account objAcc = new Account(Id = acc.Id, Number_Of_Contacts__c = acc.Contacts.size());
                accountsToBeUpdated.add(objAcc);
            }
            if(!accountsToBeUpdated.isEmpty()){
                update accountsToBeUpdated;
            }
        }
    } 
}