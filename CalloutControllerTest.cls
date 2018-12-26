@isTest
public class CalloutControllerTest{
  @isTest static void testHelpSupportAgents(){
    Continuation conti = (Continuation)CalloutController.helpSupportAgents(body);        
    StaticResource testStatic = [SELECT Id, Body FROM StaticResource WHERE Name = 'SearchResponseCon' LIMIT 1];
    String tempStr = testStatic.body.tostring();
    HttpResponse response = new HttpResponse();
    response.setBody(tempStr); 
    CalloutController controller = new CalloutController();
    Test.setContinuationResponse(controller.requestLabel, response);
    //Object searchResult = Test.invokeContinuationMethod(CalloutController.class, conti);    
    Object searchResult = Test.invokeContinuationMethod(controller, conti);
  }

}
