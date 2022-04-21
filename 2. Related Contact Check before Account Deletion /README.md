Related Contact Check before Account Deletion

DESIGN CONSIDERATIONS :
1. Create a custom mandatory field of type Checkbox on the Contact Object named “isActive (API name : isActive__c with default value false)”.

2. Create a custom mandatory field of type Checkbox on the Contact Object named “isPrimary (API name : isPrimary__c with default value false)”.

3. While deleting an Account, if the account is having more than 10 related contacts(either active, primary or none) OR if it is having at least 1 active contact which is also the primary contact then the account should not be deleted.

Example : Sample Account is — Flames Inc.

Scenario 1 : Total 15 related contacts (none are primary nor an active contact) — the account should not get deleted.
Error Message : Accounts with more than 10 contacts, cannot be deleted.

Scenario 2 : Total 15 related contacts (1 primary contact and an active one) — the account should not get deleted.
Error Message : Accounts with active and primary contacts, cannot be deleted.

Scenario 3 : Total 9 related contacts (none are primary nor an active contact) — the account should get deleted.

Scenario 4 : Total 9 related contacts (1 primary contact and an active one) — the account should not get deleted.
Error Message : Accounts with active and primary contacts, cannot be deleted.


NOTE : Use proper Exception handling wherever required.