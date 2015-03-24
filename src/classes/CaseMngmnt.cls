global class CaseMngmnt{
    /**
     * ケースにコンサルティングオプション・取引先・取引先責任者があるかチェック.
     * @param aCaseId ケースID
     * @return 結果のメッセージ
     * @author kojima
     */
    webService static String checkConsultingCase(ID aCaseId){
        CaseMngmntDate csMngmntDate = new CaseMngmntDate();
        Case cs = csMngmntDate.getCase(aCaseId);

        if(String.isEmpty(cs.consulting_opution__c)){
            return 'コンサルテイングオプションが無いです。';
        }
        if(String.isEmpty(cs.AccountId)){
            return '取引先が無いです。';
        }
        if(String.isEmpty(cs.ContactId)){
            return '取引先責任者が無いです。';
        }
        return 'ケースを完了ステータスにしました。';
    }
}