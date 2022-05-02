Rollup Summary Trigger

The most frequently asked question in an interview for the Salesforce developer role is Rollup Summary Trigger!

Scenario - Calculate the number of contacts related to an account whenever a DML operation is performed on contacts.

The special relationship between Account and Contact makes this question more interesting.

DESIGN CONSIDERATIONS :

1. Create a custom field of type Number on the Account named 'Number Of Contacts' (API name - Number_of_contacts__c) to capture the number of related contacts.
 covers all the scenarios (Insert, Update, Delete, and Undelete).


Note: Trigger should run on the after context and covers all the scenarios (Insert, Update, Delete, and Undelete)