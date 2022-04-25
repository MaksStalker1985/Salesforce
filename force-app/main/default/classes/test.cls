@isTest public class test {

    @isTest static void date_update_test(){
     List<Parent_Object__c> test_parent_object = new List<Parent_Object__c>();
        test_parent_object.add(new Parent_Object__c(Name = 'Parent test'));
        insert test_parent_object;
        update test_parent_object;
        List<Child_Object__c> test_child_object = new List<Child_Object__c>();
        test_child_object.add(new Child_Object__c(Name = 'Test 1', Value_number__c = 1));
        insert test_child_object;
        Datetime test_time;
        List<Parent_Object__c> test_parents_object = [SELECT Date_and_time__c FROM Parent_Object__c];
        for(Parent_Object__c parent_object : test_parents_object){
           test_time = (Datetime)parent_object.get('Date_and_time__c');
        }
        System.assertEquals(System.now(), test_time);
     }
    
    @isTest static void size_test(){
        List<Parent_Object__c> test_parent_object = new List<Parent_Object__c>();
        test_parent_object.add(new Parent_Object__c(Name = 'Parent test'));
        insert test_parent_object;
        update test_parent_object;       
    	List<Child_Object__c> test_child_object = new List<Child_Object__c>();
        test_child_object.add(new Child_Object__c(Name = 'Test 1',Value_number__c = 1));
        test_child_object.add(new Child_object__c(Name = 'Test 2',Value_number__c = 2));
        test_child_object.add(new Child_object__c(Name = 'Test 3',Value_number__c = 2));
        test_child_object.add(new Child_object__c(Name = 'Test 4',Value_number__c = 2));
        insert test_child_object;
        Decimal test_size;
        List<Parent_Object__c> test_parents_object = [SELECT Size__c FROM Parent_Object__c];
        for(Parent_Object__c parent_object : test_parents_object){
            test_size = (Decimal)parent_object.get('Size__c');
        } 
        System.assertEquals(test_child_object.size(), test_size);
    }  
    
    @isTest static void value_test(){
        List<Parent_Object__c> test_parent_object = new List<Parent_Object__c>();
        test_parent_object.add(new Parent_Object__c(Name = 'Parent test'));
        insert test_parent_object;
        update test_parent_object;  
        Decimal test_value_1 = 1;
        Decimal test_value_2 = 2;
        Decimal test_value_3 = 20;
        Decimal test_value_4 = 122;
    	List<Child_Object__c> test_child_object = new List<Child_Object__c>();
        test_child_object.add(new Child_Object__c(Name = 'Test 1', Value_number__c = test_value_1));
        test_child_object.add(new Child_object__c(Name = 'Test 2', Value_number__c = test_value_2));
		test_child_object.add(new Child_object__c(Name = 'Test 3', Value_number__c = test_value_3));
        test_child_object.add(new Child_object__c(Name = 'Test 4', Value_number__c = test_value_4));
        insert test_child_object;
        Decimal sum = 0;
        List<Parent_Object__c> test_parents_object = [SELECT Sum_value_from_childs__c FROM Parent_Object__c];
        for(Parent_Object__c parent_object : test_parents_object){
            sum += (Decimal) parent_object.get('Sum_value_from_childs__c');
        } 
        Double test_sum = test_value_1 + test_value_2 + test_value_3 + test_value_4;
        System.assertEquals(test_sum,sum);
    }  
}