@isTest
private class AccountMngmntTest{
    private static testMethod void creatAccountTest() {    
        Lead lead = new Lead();                
        lead.memo__c = 'テストメモ';
        lead.kaisyameikana__c = 'テストカイシャ';
        lead.syubetsu__c ='申込み';
        lead.juribi__c =Date.parse('2014/08/16') ;
        lead.moushikomipakku__c = '標準パック';
        lead.namaekana__c = 'テストナマエ';
        lead.LastName = '名前';
        lead.FirstName = 'テスト';
        lead.EMail = 'test@test.jp';
        lead.Phone = '0123-456-789';
        lead.Company = 'テスト会社';
        lead.moushikomibi__c = Date.parse('2014/08/15');
        lead.KIGYOUID__c = '111111';        
        insert lead;
        
        AccountMngmnt am = new AccountMngmnt(lead);
        Account accs = am.creatAccount();        
                       
        System.assertEquals('テストメモ', accs.memo__c);
        System.assertEquals('テストカイシャ', accs.kaisyameikana__c);
        System.assertEquals('申込み', accs.syubetsu__c);
        System.assertEquals(Date.parse('2014/08/16'), accs.juribi__c);
        System.assertEquals('標準パック', accs.moushikomipakku__c);
        System.assertEquals(Date.parse('2014/08/15'), accs.moushikomibi__c);
        System.assertEquals('テストナマエ', accs.namaekana__c);
        System.assertEquals('テスト会社', accs.Name);        
    }    
}