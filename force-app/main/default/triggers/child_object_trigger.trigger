trigger child_object_trigger on Child_Object__c (after insert, after update, after delete) {
    Double sum = 0;
    List <Child_Object__c> childs_object = [SELECT ID, Value_number__c FROM Child_Object__c];
    for (Child_object__c child_object : childs_object){
            sum +=(Double)child_object.get('Value_number__c');
    }
    List <Parent_Object__c> parents_object = [SELECT ID FROM Parent_Object__c ORDER BY ID DESC];  
    for(Parent_Object__c parent_object:parents_object){
        parent_object.Date_and_time__c = System.now();
        parent_object.Size__c = childs_object.size();
        parent_object.Sum_value_from_childs__c = sum;
    }
    update parents_object;    
}