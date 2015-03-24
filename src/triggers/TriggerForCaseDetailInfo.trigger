trigger TriggerForCaseDetailInfo on Case (Before Insert, After update){
    //before insert
    if(Trigger.isInsert && Trigger.isBefore && Trigger.isExecuting){
        for(Integer i = 0; i < Trigger.new.size(); i++){
            CaseMngmntTrigger csMngmntTrigger = new CaseMngmntTrigger();
            csMngmntTrigger.BeforeInsert(Trigger.new[i]);
        }
    }
    //after update
    else if(Trigger.isUpdate && Trigger.isAfter){
        for(Integer i = 0; i < Trigger.new.size(); i++){
            CaseMngmntTrigger csMngmntTrigger = new CaseMngmntTrigger();
            csMngmntTrigger.AfterUpdate(Trigger.old[i], Trigger.new[i]);
        }
    }
}