@isTest
private class CaseMngmntTest{
    /**
     * checkConsultingCaseのテスト.
     * @param aCase.Id 正常テスト用ケースID
     * @param bCase.Id エラーテスト用ケースID
     * @author kojima
     */
    private static testMethod void checkConsultingCaseTest(){
        Case aCase = getCaseDate();
        insert aCase;
        String returnName = CaseMngmnt.checkConsultingCase(aCase.Id);
        System.assertEquals('ケースを完了ステータスにしました。', returnName);

        Case bCase = getErrorCaseDate();
        insert bCase;
        String returnName2 = CaseMngmnt.checkConsultingCase(bCase.Id);
        System.assertEquals('コンサルテイングオプションが無いです。', returnName2);
    }
    /**
     * 正常用データ.
     * @return 取引先・取引先責任者が紐付いたコンサルティングオプションケース
     * @author kojima
     */
     private static Case getCaseDate(){
        Account acct = getAccountDate();
        insert acct;
        Contact cont = getContactDate();
        insert cont;

        Case cs = new Case();
        cs.KIGYO_ID__c = '999999';
        cs.AccountId = acct.Id;
        cs.ContactId = cont.Id;
        cs.consulting_opution__c = '標準コンサルティング';
        cs.Type = 'コンサルティングオプション申込み';
        return cs;
    }
    /**
     * テスト用の取引先.
     * @return 取引先
     * @author kojima
     */
    private static Account getAccountDate(){
        Account acct = new Account();
        acct.memo__c = 'テスト';
        acct.kaisyameikana__c = 'テストカイシャ';
        acct.syubetsu__c = '申込み';
        acct.moushikomipakku__c = '標準パック';
        acct.namaekana__c = 'テストナマエ';
        acct.Name = 'テスト会社';
        acct.KIGYO_ID__c = '999999';
        return acct;
    }
    /**
     * テスト用の取引先責任者.
     * @return 取引先
     * @author kojima
     */
    private static Contact getContactDate(){
        Contact cont = new Contact();
        cont.LastName = '名前';
        cont.FirstName = 'テスト';
        cont.Email = 'test@test.jp';
        cont.Phone = '0123-456-789';
        cont.NAME_KANA__c = 'テストナマエ';
        cont.KIGYO_ID__c = '999999';
        return cont;
    }
    /**
     * エラー用データ.
     * @return 取引先・取引先責任者が紐付いたコンサルティングオプションケース
     * @author kojima
     */
    private static Case getErrorCaseDate(){
        Account acct = getErrorAccountDate();
        insert acct;
        Contact cont = getErrorContactDate();
        insert cont;
        Case cs = new Case();
        cs.KIGYO_ID__c = '111111';
        cs.AccountId = acct.Id;
        cs.ContactId = cont.Id;
        return cs;
    }
    /**
     * テスト用の取引先.
     * @return 取引先
     * @author kojima
     */
    private static Account getErrorAccountDate(){
        Account acct = new Account();
        acct.memo__c = 'テスト';
        acct.kaisyameikana__c = 'エラーテストカイシャ';
        acct.syubetsu__c = '申込み';
        acct.moushikomipakku__c = '標準パック';
        acct.namaekana__c = 'エラーテストナマエ';
        acct.Name = 'エラーテスト会社';
        acct.KIGYO_ID__c = '111111';
        return acct;
    }
    /**
     * テスト用の取引先責任者.
     * @return 取引先
     * @author kojima
     */
    private static Contact getErrorContactDate(){
        Contact cont = new Contact();
        cont.LastName = 'エラー名前';
        cont.FirstName = 'エラーテスト';
        cont.Email = 'test@test.jp';
        cont.Phone = '0123-456-789';
        cont.NAME_KANA__c = 'エラーテストエラーナマエ';
        cont.KIGYO_ID__c = '111111';
        return cont;
    } 
}