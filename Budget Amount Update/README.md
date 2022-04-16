# SalesforceScenarios
 Salesforce Realtime scenarios for practice

DESIGN CONSIDERATIONS:

1. Create a custom field of type Currency in Account Object named “Total Budget Amount”. This is a mandatory field.

2. Create a custom field of type Currency in Contact Object named “Budget Amount”. This is a mandatory field.

3. There is some Fixed amount on Account object Record in “Total Budget Amount" Field. And suppose there are 3 contact object records related to that Account, then the Total Budget Amount(Fixed) is equally distributed among the 3 contact records and the same should be recorded in the “Budget Amount" Field.

Example : Suppose on Account Object - Sample Account is - XYZ Inc.

Mandatory Field - Total Budget Amount = 21000

and there are 3 contact records which are related to Account XYZ Inc. (child contact records)

then in the following bifurcation, the Total Budget Amount of the Account should be distributed among the 3 related contact records :
 
Contact 1 - Field - “Budget Amount"= 7000

contact 2 - Field - “Budget Amount"= 7000"

contact 3 - Field - “Budget Amount"= 7000"


NOTE : Whenever new Contact is created(for the same account) or deleted (which is already related to that account), the recalculation of Total Budget Amount should take place.
              