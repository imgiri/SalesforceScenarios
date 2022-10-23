public with sharing class caseQueueAssignment_Handler {

    //List to fetch all queue names
    public static List<Group> queueList = new List<Group>();

    //Map of Queue Names (Name as Key and Queue Id as value)
    public static Map<String, Id> queueNameIdMAP = new Map<String, Id>();
    
    //empty constructor
    public caseQueueAssignment_Handler() {


    }

    //method to be executed on before insert
    public static void queueAssignmentonInsert(List<Case> caseList) {

       
        try {

            getQueues();
    
            //looping over the list of inserted cases
            for(Case looping_variable : caseList)
            {   
                
                if(String.isNotBlank(looping_variable.Case_Origin_Location__c)){
                    
                    looping_variable.OwnerId = queueNameIdMAP.get(looping_variable.Case_Origin_Location__c);
                }
                
            }
            
        } catch (System.NullPointerException e) {
            system.debug('exception '+e);
        }
                   
    }

    //method to be executed on before update
    public static void queueAssignmentonUpdate(List<Case> oldCaseList , List<Case> newCaseList) {

       
        try {

            getQueues();
    
            //looping over the list of updated cases
            for(Integer i= 0 ;i < newCaseList.size() ; i++)
            {   
                
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

    //method to populate the queueNameIdMAP
    public static void getQueues(){

        queueList = [select Id,Name,developerName from Group where type = 'Queue' LIMIT 50000];
            for (Group looping_variable : queueList){
                queueNameIdMAP.put(looping_variable.name, looping_variable.id);
            }

    }

}
