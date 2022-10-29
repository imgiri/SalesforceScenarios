Prevent Unauthorised Users to Update/Delete Task Records

Scenario - When a task record is being updated or deleted we have to check if the user is having the appropriate access to perform updation or deletion on the task record and process the record accordingly.

The object access for task object cannot be modified, so we will be using custom permissions and permission sets as well with triggers to cover this scenario.

DESIGN CONSIDERATIONS :

1. Create a permission set with below details : 

Label : modifyTaskRecords
API Name : modifyTaskRecords
Description : The permission set allows user to update or delete the tasks records.
Session Activation Required : False
Licence : Salesforce

2. Create a custom permission with below details : 

Label : modifyTaskRecords
API Name : modifyTaskRecords
Description : The permission set allows user to update or delete the tasks records.

3. Authorised Users who have been assigned the modifyTaskRecords permission set will be able to update/delete the task records, the rest of the users have to be restricted to do so.

 

Note: 
Cover the appropriate trigger context variables(Insert, Update, Delete, and Undelete).
Follow proper Exception handling wherever required. 
Follow Best Practices of Triggers and Apex.
