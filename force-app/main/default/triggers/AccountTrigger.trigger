/*
  @description Account Trigger
*/
trigger AccountTrigger on Account (before insert, after insert, before update, after update, before delete, after delete, before undelete, after undelete) {
  CommonTriggerHandler.invoke();
}
