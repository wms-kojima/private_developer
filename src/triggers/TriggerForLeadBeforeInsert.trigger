trigger TriggerForLeadBeforeInsert on Lead (Before Insert) {
    LeadMngmnt.SetValueRecieveForm(Trigger.new);
}