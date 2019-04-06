global class ScheduleClass implements Schedulable {
   global void execute(SchedulableContext SC) {
   	// Setting Chunk size as 100
      database.executeBatch(new SendSurveyBatch(), 100);
   }
}