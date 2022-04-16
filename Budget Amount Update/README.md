
BUDGET AMOUNT UPDATE

DESIGN CONSIDERATIONS :
1. Create a custom mandatory field of type Currency on the Account Object named “Total Budget Amount”.

2. Create a custom mandatory field of type Currency in Contact Object named “Budget Amount”.

3. There will be some Fixed amount on Account object Record in “Total Budget Amount” Field. And let’s suppose there are 3 contact object records related to that Account, then the Total Budget Amount(Fixed) will be equally distributed among the 3 contact records and the same should be recorded in the “Budget Amount” Field.

Example : Sample Account is — XYZ Inc.

Total Budget Amount = 21000 and there are 3 contact records which are related to Account XYZ Inc. (child contact records),
then in the following bifurcation, the Total Budget Amount of the Account should be distributed among the 3 related contact records :

Contact 1 — “Budget Amount” = 7000
contact 2 — “Budget Amount” = 7000
contact 3 — “Budget Amount” = 7000

NOTE : Whenever new Contact is created(for the same account) or deleted (which is already related to that account), the recalculation of Total Budget Amount should take place.