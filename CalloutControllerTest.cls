@isTest
public class CalloutControllerTest{
  @isTest static void testHelpSupportAgents(){
     String body = '{"searchString":"testing Su console","resultsPerPage":10,"pageNo":1,"orderBy":"desc","aggregations":[],"sortBy":"_score","from":0,"caseId":"5000973788udfhI"}';
    Continuation conti = (Continuation)CalloutController.helpSupportAgents(body);        
    StaticResource testStatic = [SELECT Id, Body FROM StaticResource WHERE Name = 'SearchResponseCon' LIMIT 1];
    String tempStr = testStatic.body.tostring();
    HttpResponse response = new HttpResponse();
    response.setBody(tempStr); 
    CalloutController controller = new CalloutController();
    Test.setContinuationResponse(CalloutController.requestLabel, response);
    //Object searchResult = Test.invokeContinuationMethod(CalloutController.class, conti);    
    Object searchResult = Test.invokeContinuationMethod(controller, conti);
  }

}
