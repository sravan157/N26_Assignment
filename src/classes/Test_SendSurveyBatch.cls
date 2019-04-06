/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class Test_SendSurveyBatch {

    static testMethod void myUnitTest() {
        // Setup test Data
        // This is usually setup using a TestDataFactory.
        Account acc = new Account();
        acc.Name = 'Test Account'+system.now();
        insert acc;
        
        List<Contact> conList = new List<Contact>();
        Contact con1 = new Contact();
        con1.LastName = 'L1';
        con1.Survey_Date__c = system.today();
        con1.Language__c = 'en_US';
        con1.AccountId = acc.id;
        conList.add(con1);
        
        Contact con2 = new Contact();
        con2.LastName = 'L2';
        con2.Survey_Date__c = system.today()-2;
        con2.Language__c = 'en_US';
        con2.AccountId = acc.id;
        conList.add(con2);
        
        Contact con3 = new Contact();
        con3.LastName = 'L3';
        con3.Survey_Date__c = system.today()-1;
        con3.Language__c = 'de';
        con3.AccountId = acc.id;
        conList.add(con3);
        
        insert conList;
        
        Test.startTest();
		SendSurveyBatch ssb = new SendSurveyBatch();
        database.executeBatch(ssb, 100);
        Test.stopTest();
    }
    
    static testMethod void myUnitTest2() {
        // Setup test Data
        // This is usually setup using a TestDataFactory.
        Configurations__c c = new Configurations__c();
        c.Name = 'Email_Limit';
        c.Limit__c = 1;
        insert c;
        
        Account acc = new Account();
        acc.Name = 'Test Account 2'+system.now();
        insert acc;
        
        List<Contact> conList = new List<Contact>();
        Contact con1 = new Contact();
        con1.LastName = 'L1';
        con1.Survey_Date__c = system.today();
        con1.Language__c = 'en_US';
        con1.AccountId = acc.id;
        conList.add(con1);
        
        Contact con2 = new Contact();
        con2.LastName = 'L2';
        con2.Survey_Date__c = system.today()-2;
        con2.Language__c = 'en_US';
        con2.AccountId = acc.id;
        conList.add(con2);
        
        Contact con3 = new Contact();
        con3.LastName = 'L3';
        con3.Survey_Date__c = system.today()-1;
        con3.Language__c = 'de';
        con3.AccountId = acc.id;
        conList.add(con3);
        
        Contact con4 = new Contact();
        con4.LastName = 'L3';
        con4.Survey_Date__c = system.today()-3;
        con4.Language__c = 'de'; 
        con4.AccountId = acc.id;
        conList.add(con4);
        
        insert conList;
        
        Test.startTest();
		SendSurveyBatch ssb = new SendSurveyBatch();
        database.executeBatch(ssb, 100); 
        Test.stopTest();
    }
    
    static testMethod void myUnitTest3() {
        Test.startTest();
    	ScheduleClass sc = new ScheduleClass();
        sc.execute(null);
    	Test.stopTest();
    }
}