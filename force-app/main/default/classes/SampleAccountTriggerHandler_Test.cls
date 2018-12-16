@isTest
private class SampleAccountTriggerHandler_Test {

    @isTest
    static void testAll() {

        Test.startTest();
        // test the insert of a new account
        Account acc1 = new Account(Name='Test');
        insert acc1;
        Id theAccountId = acc1.Id;
        System.assert(theAccountId != null);

        // test updating the account
        acc1.BillingCity = 'TestVille';
        update acc1;
        Account testAcc = [SELECT Id,Name,BillingCity FROM Account WHERE Id = :theAccountId];
        System.assertEquals(acc1.BillingCity, testAcc.BillingCity);

        // test deleting the account
        delete acc1;
        List<Account> accList = [SELECT Id,Name,BillingCity FROM Account WHERE Id = :theAccountId];
        System.assertEquals(0, accList.size());

        // test undelete
        undelete acc1;
        testAcc = [SELECT Id,Name,BillingCity FROM Account WHERE Id = :theAccountId];
        System.assertEquals(acc1.BillingCity, testAcc.BillingCity);

        Test.stopTest();
        
    }

}
