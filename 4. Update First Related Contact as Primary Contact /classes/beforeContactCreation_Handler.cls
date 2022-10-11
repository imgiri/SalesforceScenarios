public with sharing class beforeContactCreation_Handler {

    //set of Account IDs to which contacts are related
    public static SET<ID> AccountIDs = new SET<ID>();

    //list to hold the first created contact of any account
    //public static LIST<Contact> ContactListToUpdate = new LIST<Contact>();

    //Map to hold the first contact of an account
    public static MAP<ID, Contact> AccContactMap = new Map<Id, Contact>();

    //map to hold the count of contacts of an account
    public static MAP<ID, Integer> AccContactCountMap = new Map<Id, Integer>();

    //empty constructor
    public beforeContactCreation_Handler() {

    }

    public static void checkContacts(List<Contact> ContactList) {

        //looping over the list of inserted contacts
        for(Contact looping_variable : ContactList)
        {   
            //filtering the accountIDs from the contacts List
            if(looping_variable.AccountId != null){
                
                AccountIDs.add(looping_variable.AccountId);
            }
            
        }

        //using the Account IDs fetching all the contacts of those accounts and looping over
        for(Contact looping_variable : [SELECT Id, AccountId , Primary_Contact__c from Contact WHERE AccountId IN: AccountIDs ORDER BY CreatedDate ASC LIMIT 50000]){

            //adding the contact which will be or created first 
            if(!AccContactCountMap.containskey(looping_variable.AccountId)){

                looping_variable.Primary_Contact__c = true;
                AccContactCountMap.put(looping_variable.AccountId , 1);
                AccContactMap.put(looping_variable.AccountId , looping_variable);

            }

            //filtering the other contacts, if multiple contacts already exists
            else{

                looping_variable.Primary_Contact__c = false;
                AccContactCountMap.put(looping_variable.AccountId , AccContactCountMap.get(looping_variable.AccountId) + 1);
            }
            
        }

        //DML to update the Primary contact checkbox of the first contact
        if(!AccContactMap.isEmpty() && AccContactMap.size() > 0 ){
            system.debug('count : '+AccContactMap.size());
            update AccContactMap.values();
        }

    }
}
