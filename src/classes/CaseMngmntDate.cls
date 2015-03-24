public class CaseMngmntDate{
    /**
     * ボタンから渡されたケースidからSQLで情報取得.
     * @param aCaseId ケースID
     * @return コンサルティングオプションのケース
     * @author kojima
     */
    public Case getCase(ID aCaseId){
        return [SELECT
                   KIGYO_ID__c,
                   AccountId,
                   ContactId,
                   consulting_opution__c
               FROM
                   Case
               WHERE
                   Id = :aCaseId
               ];
    }
    /**
     * 企業idから取引先情報取得.
     * @param aKigyoId 企業ID
     * @return 取引先
     * @author kojima
     */  
    public Account getKigyoIdAccount(String aKigyoId){
        return  [SELECT
                    Id,
                    memo__c,
                    kaisyameikana__c,
                    syubetsu__c,
                    juribi__c,
                    moushikomipakku__c,
                    moushikomibi__c,
                    namaekana__c,
                    Name,
                    KIGYO_ID__c
                FROM
                    Account
                WHERE
                    KIGYO_ID__c = :aKigyoId
                ];
    }
    /**
     * 企業idから取引先責任者情報取得.
     * @param aKigyoId 企業ID
     * @return 取引先責任者
     * @author kojima
     */ 
    public Contact getKigyoIdContact(String aKigyoId){
        return [SELECT
                    LastName,
                    FirstName,
                    NAME_KANA__c,
                    Email,
                    Phone,
                    KIGYO_ID__c,
                    Accountid,
                    Id
                FROM
                    Contact
                WHERE
                    KIGYO_ID__c = :aKigyoId
                ];
    }
    /**
     * コンサルティングオプションのサービスを取得する.
     * @param aKigyoId 企業ID
     * @param anAccountId 取引先ID
     * @return コンサルティングオプションのサービス
     * @author kojima
     */
    public service__c getService(String aKigyoId,ID anAccountId){
        service__c service = new service__c();
        service.moushikomipakku__c = 'コンサルティングオプション';
        service.torihikisaki__c = anAccountId;
        service.RIYOUKAISHIBI__c = System.today();
        service.KIGYO_ID__c = aKigyoId;
        return service;
    }
}