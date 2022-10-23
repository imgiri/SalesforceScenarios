Assign Queue to the new/updated cases

Scenario - When a new case is created we have to assign the appropriate queue and account depending on the Origin of the case.
If the inserted/updated case is from a particular location (eg., Mumbai, Hyderabad) then it should be assigned/re-assigned to the respective queue.

DESIGN CONSIDERATIONS :
1. Create a mandatory custom field of type Picklist on the Case Object named Case Origin Location (API name : Case_Origin_Location__c with default value false) and add the below picklist values which has to be displayed in alphabetical order.
 i) Mumbai
ii) Hyderabad
iii) Bengaluru
iv) Delhi
v) Kolkata

2. Add Field dependency to the Case Origin Location Field such that the controlling field would be the standard field Case Origin (API name : Origin) and all the Case Origin Location values should be visible for every value of Case Origin.

3. Create Queues for different Case Origin Location, the respective queue will be assigned to the cases depending on the Case Origin Location value.

Note: 
Cover the appropriate trigger context variables(Insert, Update, Delete, and Undelete).
Follow proper Exception handling wherever required. 
Follow Best Practices of Triggers and Apex.