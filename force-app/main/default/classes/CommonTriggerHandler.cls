/*
   @description: Common handler for triggers
 */
public with sharing class CommonTriggerHandler {

// the main method to invoke the trigger handler
  public static void invoke() {
    // get the name of the SObject
    String objName = determineSObjectName();
    // check to see if the trigger is enabled
    if(objName != null) {
      // retrieve the TriggerHandler custom metadata records for the SObject
      for(TriggerHandler__mdt triggerHandler:[SELECT Label, Order__c FROM TriggerHandler__mdt WHERE SObjectType__c = :objName ORDER BY Order__c ]) {
        Callable handler = (Callable)Type.forName(triggerHandler.Label).newInstance();
        handler.call(null,null);
      }
    }
  }

// method to retrieve the SObject name based on the items passed to the trigger
  private static String determineSObjectName() {
    List < SObject >newList = Trigger.new;
    List < SObject >oldList = Trigger.old;
    String sObjectName = null;
    if(newList.size() > 0) {
      sObjectName = newList[0].getSObjectType().getDescribe().name;
    } else if(oldList.size() > 0) {
      sObjectName = oldList[0].getSObjectType().getDescribe().name;
    }
    return sObjectName;
  }

}
