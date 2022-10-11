Primary Contact Update

Scenario - When a related contact of an Account is created we have to perform the following :

1. If the inserted contact is the first contact the contact, then it should be marked as the primary contact for the related Account.

2. If multiple contacts are already related to an Account, then post insertion of the new contact we have to make sure that the contact which has been created first, should be the primary contact of the Account.

DESIGN CONSIDERATIONS :

1. Create a custom field of type Checkbox on the Contact Object named “Primary Contact (API name : Primary_Contact__c with default value false)”.

2. Whenever a related contact is being created, the checkbox value should be marked true for the very first contact which will be created or already created.

Cover the appropriate trigger context variables(Insert, Update, Delete, and Undelete).


Note: Trigger should run on the after context.
Follow proper Exception handling wherever required.
Follow Best Practices of Triggers and Apex.