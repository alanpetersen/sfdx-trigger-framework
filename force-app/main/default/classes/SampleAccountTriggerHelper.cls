/*
    @description: Account Trigger Helper to perform logic for handler
 */
public with sharing class SampleAccountTriggerHelper {

  public static void doSomethingBeforeInsert(List<Account> accounts) {
    System.debug('### BEFORE INSERT');
  }

  public static void doSomethingAfterInsert(List<Account> accounts) {
    System.debug('### AFTER INSERT');
  }

  public static void doSomethingBeforeUpdate(List<Account> oldAccounts, List<Account> updatedAccounts, Map<Id,SObject> accountMap) {
    System.debug('### BEFORE UPDATE');
  }

  public static void doSomethingAfterUpdate(List<Account> oldAccounts, List<Account> updatedAccounts, Map<Id,SObject> accountMap) {
    System.debug('### AFTER UPDATE');
  }

  public static void doSomethingBeforeDelete(List<Account> deletedAccounts) {
    System.debug('### BEFORE DELETE');
  }

  public static void doSomethingAfterDelete(List<Account> deletedAccounts) {
    System.debug('### AFTER DELETE');
  }

  public static void doSomethingAfterUndelete(List<Account> accounts) {
    System.debug('### AFTER UNDELETE');
  }

}
