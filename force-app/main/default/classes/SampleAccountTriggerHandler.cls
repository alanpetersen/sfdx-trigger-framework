/*
    @description: Handler to handle trigger logic of Account object
*/
public with sharing class SampleAccountTriggerHandler implements Callable {
  public Object call(String action, Map<String, Object>args) {

    System.debug('==== SampleAccountTriggerHandler');

    // If action is Before Insert
    if(Trigger.isBefore && Trigger.isInsert) {
      SampleAccountTriggerHelper.checkForRestrictedAttachments(Trigger.new);
      CoreBaseFeedItemTriggerHelper.preventSharingPosts(Trigger.new);

      // If action is After Insert
    } else if(Trigger.isAfter && Trigger.isInsert) {
      SampleAccountTriggerHelper.insertDeletedChatterRecord(Trigger.new);
      CoreBaseFeedItemTriggerHelper.emailChatterPosts(Trigger.new);

      // If action is Before Delete
    } else if(Trigger.isBefore && Trigger.isDelete) {
      SampleAccountTriggerHelper.preventDeletion(Trigger.old);

    }

    return null;
  }

}
