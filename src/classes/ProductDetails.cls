public with sharing class ProductDetails {
	
    @auraEnabled
    public static Feature__c getProductDetails(Id caseId){
        Feature__c retFeature = new Feature__c();
        List<Case> currentCase = new List<Case>();
        currentCase = [Select id, Contact.Product__c , Contact.Home_Country__c from Case
                      where id =: caseId];
        if(currentCase.size()>0){ 
            if(currentCase[0].Contact.Product__c != null && currentCase[0].Contact.Home_Country__c != null){
                List<Feature__c> featureList = new list<Feature__c>();
                featureList = [Select id, ATM_Fee_in_other_currencies__c , Card_Replacement_Cost__c ,Cost_per_Calendar_Month__c,
                              Home_Country__r.Name, CurrencyISOCode, Product__r.Name
                              from Feature__c where
                              Home_Country__c =: currentCase[0].Contact.Home_Country__c AND Product__c =: currentCase[0].Contact.Product__c];
                if(featureList.size() > 0){
                    retFeature = featureList[0];
                }else{
                    return retFeature;
                }
            }else{
                return retFeature;
            }
        }
    	return retFeature;
    }
    
}