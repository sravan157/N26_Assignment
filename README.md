Have created a dev org in case you need to check out the setup. Hopefully i havent missed out any of the components :)

URL : Login.salesforce.com 
UserName : sravan@n26.com 
Password : Test@123 
Security Token : SPmKf72cCyWy6IhB82g7Lr5i

Custom Fields:
Contact.Language__c - Picklist(Default Value - en, Made object level Mandatory. If legacy data is present, script has to be run to update the same)
Contact.Survey_Date__c - This will be filled by a different service. Populating manually for testing.
Custom Setting: Configurations - Contains a record - Email_Limit - 100 (This is configurable from where the daily email limits can be set, defaulted to 100 in Apex)

Workflow for Email Update: Send Survey Email Workflow - Is fired on the condition Contact: Survey Date EQUALS null (Evaluate the rule when a record is created, and any time it's edited to subsequently meet criteria)

Email template has the language parameter: Survey Email Template

Batch nulls the Survey Date which fires the Email Alert: SendSurveyBatch

Scheduled Class : ScheduleClass (Can be scheduled from Apex Classes.)

Custom Label: Survey_Email_Body

Translation is enabled for en and de.

TestClass: Test_SendSurveyBatch
