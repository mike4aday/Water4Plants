public with sharing class Water4PlantsController {

    public Water4PlantsController() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Plant__c> getThirstyPlants(Id rootLocationId) {
        List<Plant__c> plants;
        if (rootLocationId != NULL) {
            // Return all thirsty plants whose root location matches the argument 'rootLocationId'
            // TODO: Implement pagination for a real-world app
            // TODO: Handle security exceptions gracefully
            plants = [
                SELECT Id, Name, Nickname__c, Kind__c, Last_Watering__c, Watering_Period__c, Location__r.Name 
                FROM Plant__c 
                WHERE Requires_Watering__c = TRUE AND Location__r.RootLocationId = :rootLocationId
                WITH SECURITY_ENFORCED
            ];
        }
        else {
            // Return all thirsty plants
            // TODO: Implement pagination for a real-world app
            // TODO: Handle security exceptions gracefully
            plants = [
                SELECT Id, Name, Nickname__c, Kind__c, Last_Watering__c, Watering_Period__c, Location__r.Name 
                FROM Plant__c 
                WHERE Requires_Watering__c = TRUE 
                WITH SECURITY_ENFORCED
            ];
        }
        return plants;
    }
}
