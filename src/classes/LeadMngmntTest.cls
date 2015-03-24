@isTest
private class LeadMngmntTest{
    private static testMethod void getledsTest() {    
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
        
        LeadMngmnt LM = new LeadMngmnt();
        Lead leds = LM.getleds(lead.id);
                
        System.assertEquals('テストメモ', leds.memo__c);
        System.assertEquals('テストカイシャ', leds.kaisyameikana__c);
        System.assertEquals('申込み', leds.syubetsu__c);
        System.assertEquals(Date.parse('2014/08/16'), leds.juribi__c);
        System.assertEquals('標準パック', leds.moushikomipakku__c);
        //System.assertEquals(Date.parse('2014/08/15'), leds.moushikomibi__c);
        System.assertEquals('テストナマエ', leds.namaekana__c);
        System.assertEquals('テスト会社', leds.Company);
        System.assertEquals('名前', leds.LastName);
        System.assertEquals('テスト', leds.FirstName);
        System.assertEquals('test@test.jp', leds.Email);
        System.assertEquals('0123-456-789', leds.Phone);
        System.assertEquals('111111', leds.KIGYOUID__c);        
    }
}