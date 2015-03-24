@isTest
private class MailMngmntTest{

    //組織Emailアドレスのテスト
    private static testMethod void getOrgWideEmailAddressTest() {            
        MailMngmnt MM = new MailMngmnt();
        OrgWideEmailAddress owa = MM.getOrgWideEmailAddress('管理者');
               
        System.debug(owa.Address + 'debug');    
        System.assertEquals('kojima@wmshome.net',owa.Address);        
    }
    
    //テンプレートのテスト
    private static testMethod void getEmailFromTemplateTest() {    
       EmailTemplate temptest = new EmailTemplate();       
       temptest.subject ='テストですから';
       temptest.body = '残念！';
       temptest.name = 'テスト用のテンプ';
       temptest.DeveloperName = 'testtemplate';
       temptest.FolderId = '00510000003DJRT';
       temptest.TemplateType = 'text';
       insert temptest;
       
       MailMngmnt MM = new MailMngmnt();
       EmailTemplate temp = MM.getEmailFromTemplate('テスト用のテンプ');       
    
        System.assertEquals('テストですから',temp.subject); 
        System.assertEquals('残念！',temp.body);        
    }
    
    //メール作成のテスト
    private static testMethod void createEmailMessageTest() {    
        //lead情報
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
                
        MailMngmnt MM = new MailMngmnt();
        
        //組織アドレス持ってくる
        OrgWideEmailAddress owa = MM.getOrgWideEmailAddress('管理者');
        //件名、本文設定
        EmailTemplate temp = MM.getEmailFromTemplate('受理受付');        
     
        Messaging.SingleEmailMessage mail = MM.createEmailMassage(lead.id,owa.id,temp.id);
        
        System.assertEquals(lead.id,mail.TargetObjectId);
        System.assertEquals(owa.id,mail.OrgWideEmailAddressId);
        System.assertEquals(temp.id,mail.TemplateId);
    }  

}