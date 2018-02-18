// Example 1

Database.DMLOptions dmo = new Database.DMLOptions();
dmo.assignmentRuleHeader.useDefaultRule = true;

Lead l = new Lead(Company='ABC', LastName='Smith');

l.setOptions(dmo);
insert l;

// Example 2

Database.DMLOptions dmo = new Database.DMLOptions();
dmo.assignmentRuleHeader.assignmentRuleId ='01QD0000000EqAn';

Lead l = new Lead(Company='ABC', LastName='Smith');
l.setOptions(dmo);
insert l;
