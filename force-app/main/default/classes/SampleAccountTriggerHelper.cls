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

  public static void doSomethingBeforeUpdate(List<Account> accounts, Map<Id,Account> oldAccountMap) {
    System.debug('### BEFORE UPDATE');
  }

  public static void doSomethingAfterUpdate(List<Account> accounts, Map<Id,Account> oldAccountMap) {
    System.debug('### AFTER UPDATE');
  }

  public static void doSomethingBeforeDelete(List<Account> deletedAccounts) {
    System.debug('### BEFORE DELETE');
  }

  public static void doSomethingAfterDelete(List<Account> deletedAccounts) {
    System.debug('### AFTER DELETE');
  }

  public static void doSomethingBeforeUndelete(List<Account> accounts) {
    System.debug('### BEFORE UNDELETE');
  }

  public static void doSomethingAfterUndelete(List<Account> accounts) {
    System.debug('### AFTER UNDELETE');
  }

}
