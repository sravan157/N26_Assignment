@isTest
private class Test_ProductDetails {

    static testMethod void myUnitTest() {
        Product__c pr = new Product__c();
		pr.Name = 'Test';
		insert pr;
        
        Home_Country__c hc = new Home_Country__c();
        hc.Name = 'DE';
        insert hc;
        
        Feature__c fe = new Feature__c();
        fe.Name = 'fe1';
        fe.Home_Country__c = hc.id;
        fe.Product__c = pr.id;
        insert fe;
        
        Account acc = new account();
        acc.Name = 'T1Acc';
        insert acc;
        
        Contact con = new contact();
        con.LastName = 'Last';
        con.Language__c = 'de';
        con.Home_Country__c = hc.id;
        con.Product__c = pr.id;
        insert con;
        
        case c = new case();
        c.contactId = con.id;
        insert c;
		        
        ProductDetails.getProductDetails(c.id);
        
        con.Home_Country__c = null;
        update con;
        ProductDetails.getProductDetails(c.id);
        
    }
    
}