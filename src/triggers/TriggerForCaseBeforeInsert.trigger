trigger TriggerForCaseBeforeInsert on Case (Before Insert) {
    CaseMngmntTrigger csMngmntTrigger = new CaseMngmntTrigger();
    csMngmntTrigger.BeforeInsert(Trigger.new);
}