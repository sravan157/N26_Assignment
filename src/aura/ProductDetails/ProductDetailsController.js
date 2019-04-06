({
	doInit : function(component, event, helper) {
		var action = component.get('c.getProductDetails');
        action.setParams({
            caseId : component.get("v.recordId")
        });
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                if(result.Id != undefined){
                    component.set('v.isProduct', true);
                }   
                console.log('result', result.ATM_Fee_in_other_currencies__c);
                var featVar = {
                    Cost_per_Calendar_Month__c : result.Cost_per_Calendar_Month__c != undefined ? result.Cost_per_Calendar_Month__c : 'N/A',
                    ATM_Fee_in_other_currencies__c : result.ATM_Fee_in_other_currencies__c != undefined ? result.ATM_Fee_in_other_currencies__c : 'Free',
                    Card_Replacement_Cost__c : result.Card_Replacement_Cost__c,
                    CurrencyIsoCode : result.CurrencyIsoCode,
                    Name : result.Product__r.Name,
                }
                console.log('result1', featVar.ATM_Fee_in_other_currencies__c);
                if(typeof featVar.Cost_per_Calendar_Month__c == 'string' ){
                    component.set('v.costCalenderIsText', true);
                }

                if(typeof featVar.ATM_Fee_in_other_currencies__c == 'string'){
                    component.set('v.atmIsText', true);
                }
                
                component.set('v.productDetails', featVar);
            }
		});
		$A.enqueueAction(action);
	}
})