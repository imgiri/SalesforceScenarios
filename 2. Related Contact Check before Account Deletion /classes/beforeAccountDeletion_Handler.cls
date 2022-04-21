public without sharing class beforeAccountDeletion_Handler {

    public static SET<ID> AccountIDs = new SET<ID>();
    public static MAP<ID, Integer> AccContactMap = new Map<Id, Integer>();
    public static MAP<ID, Boolean> AccContactFlag_Map = new Map<Id, Boolean>();
    public static Boolean isActiveOrPrimaryFlag = false;

    public static void checkContacts(List<Account> Acc) {


        for(Account looping_variable : Acc)
        {

            AccountIDs.add(looping_variable.id);

        }

        for(Contact c : [SELECT Id, Account.Id , isPrimary__c, isActive__c from Contact WHERE Account.Id IN: AccountIDs LIMIT 50000])
        {
            
            if(!(c.isPrimary__c && c.isActive__c))
            {

                if(!AccContactMap.containskey(c.account.id))
                {

                    AccContactMap.put(c.account.Id , 1);

                }

                else
                {

                    AccContactMap.put(c.account.Id , AccContactMap.get(c.account.Id) + 1);

                }

            }

            else
            {

                if(!AccContactFlag_Map.containskey(c.account.id))
                {
                    AccContactFlag_Map.put(c.account.Id , true);
                }
                

            }
            

        }

    
        for(Account looping_variable : Acc)
        {

                IF(AccContactMap.get(looping_variable.id) > 10)
                {

                    looping_variable.addError('Accounts with more than 10 contacts cannot be deleted.');

                }


                try{

                    IF(AccContactFlag_Map.get(looping_variable.id))
                    {

                    looping_variable.addError('Accounts with Primary and active contacts cannot be deleted.');

                    }
                }
                catch(System.NullPointerException e){

                    system.debug('Accounts with more than 10 contacts but not a single contact is primary contact and active contact');
                }

            

        }



    }

}
