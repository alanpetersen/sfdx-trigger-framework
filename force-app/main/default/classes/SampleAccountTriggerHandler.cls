/*
    @description: Handler to handle trigger logic of Account object
*/
public with sharing class SampleAccountTriggerHandler implements Callable {
  public Object call(String action, Map<String, Object>args) {

    System.debug('==== SampleAccountTriggerHandler');

    if(Trigger.isBefore && Trigger.isInsert) {
      SampleAccountTriggerHelper.doSomethingBeforeInsert(Trigger.new);
    } else if(Trigger.isAfter && Trigger.isInsert) {
      SampleAccountTriggerHelper.doSomethingAfterInsert(Trigger.new);
    } else if(Trigger.isBefore && Trigger.isUpdate) {
      SampleAccountTriggerHelper.doSomethingBeforeUpdate(Trigger.old, Trigger.new, Trigger.oldMap);
    } else if(Trigger.isAfter && Trigger.isUpdate) {
      SampleAccountTriggerHelper.doSomethingAfterUpdate(Trigger.old, Trigger.new, Trigger.oldMap);
    } else if(Trigger.isBefore && Trigger.isDelete) {
      SampleAccountTriggerHelper.doSomethingBeforeDelete(Trigger.old);
    } else if(Trigger.isAfter && Trigger.isDelete) {
      SampleAccountTriggerHelper.doSomethingAfterDelete(Trigger.old);
    } else if(Trigger.isAfter && Trigger.isUndelete) {
      SampleAccountTriggerHelper.doSomethingAfterUndelete(Trigger.new);
    }

    return null;
  }

}
