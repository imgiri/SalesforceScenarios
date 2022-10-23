public with sharing class caseQueueAssignment_Handler {

    //set of Account IDs to which contacts are related
    public static SET<ID> caseIDs = new SET<ID>();
    public static List<Group> queueList = new List<Group>();
    public static Map<String, Id> queueNameIdMAP = new Map<String, Id>();
    

    public caseQueueAssignment_Handler() {


    }

    public static void queueAssignmentonInsert(List<Case> caseList) {

       
        try {

            getQueues();
    
            //looping over the list of inserted/updated contacts
            for(Case looping_variable : caseList)
            {   
                //filtering the accountIDs from the contacts List
                if(String.isNotBlank(looping_variable.Case_Origin_Location__c)){
                    
                    looping_variable.OwnerId = queueNameIdMAP.get(looping_variable.Case_Origin_Location__c);
                }
                
            }
            
        } catch (System.NullPointerException e) {
            system.debug('exception '+e);
        }
                   
    }

    public static void queueAssignmentonUpdate(List<Case> oldCaseList , List<Case> newCaseList) {

       
        try {

            getQueues();
    
            //looping over the list of inserted/updated contacts
            for(Integer i= 0 ;i < newCaseList.size() ; i++)
            {   
                //filtering the accountIDs from the contacts List
                if(String.isNotBlank(newCaseList[i].Case_Origin_Location__c)){

                    if(!newCaseList[i].Case_Origin_Location__c.equalsIgnoreCase(oldCaseList[i].Case_Origin_Location__c)){

                        newCaseList[i].OwnerId = queueNameIdMAP.get(newCaseList[i].Case_Origin_Location__c);
                    }
                    
                }
                
            }
            
        } catch (System.NullPointerException e) {
            system.debug('exception '+e);
        }
                   
    }

    public static void getQueues(){

        queueList = [select Id,Name,developerName from Group where type = 'Queue' LIMIT 50000];
            for (Group looping_variable : queueList){
                queueNameIdMAP.put(looping_variable.name, looping_variable.id);
            }

    }

}
