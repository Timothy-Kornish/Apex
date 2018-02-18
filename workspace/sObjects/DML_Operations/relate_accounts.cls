Opportunity newOpportunity = new Opportunity(Name = 'OpportunityWithAccountInsert', StageName = 'Prospecting', CloseDate = Date.today().addDays(7));

// create the parent record reference
// An Account with this external ID value already exists

//This sObject is used only for foreign key reference
// and doesn't contain any other fields.

Account accountReference = new Account(MyExtID__c='SAP111111');

// Add the nested account sObject to the opportunity
newOpportunity.Account = accountReference;

// create the opportunity
Database.SaveResult results = Database.insert(newOpportunity);
