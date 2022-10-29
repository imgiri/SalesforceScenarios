public class taskTrigger_Handler {
    
    public static Boolean hasPermission = FeatureManagement.checkPermission('modifyTaskRecords');
	
    public static void preventTaskUpdation(List<Task> taskList) {
       
        if(!hasPermission){
            
            for(Task looping_variable : taskList)
            {   
                looping_variable.addError('Insufficient Priviledges to update the task record');
            }
            
		}
        
        
    }
    
    public static void preventTaskDeletion(List<Task> taskList) {
        
        if(!hasPermission){
            
            for(Task looping_variable : taskList)
            {   
                looping_variable.addError('Insufficient Priviledges to delete the task record');
            }
            
        }
        
    }
}