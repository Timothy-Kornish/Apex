Lead myLead = new Lead(LastName = 'Fry', Company = 'Fry and Sons');
insert myLead;

Database.LeadConvert lc = new Database.LeadConvert();
lc.setLeadId(myLead.Id);

LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
lc.setConvertedStatus(convertStatus.MasterLabel);

Database.LeadConvertResult lcr = Database.convertLead(lc);
System.assert(lcr.isSuccess());

