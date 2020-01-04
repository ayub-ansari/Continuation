global class CalloutController{
    public static String requestLabel;
    @RemoteAction
    public static Object helpSupportAgents(String body){
      Map<String, Object> jsonPayload = new jsonPayload()
      jsonPayload.put('searchKeyword', body);
      String endpoint = '<long running callout endpoint>';//I can not provide url due to security issue
      Continuation searchContinuation = makeContinuation('callbackMethod', 'POST', endpoint, JSON.serialize(jsonPayload));
      searchContinuation.state = searchContinuation.addHttpRequest(req); 
      return searchContinuation; 
    }
    public static Object callbackMethod(Object state){
      HttpResponse res = Continuation.getResponse((String)state);
      return res.getBody();
    }
    //method
    public static Continuation makeContinuation(String contMethodName, String method, String endpoint, String requestPayload){
        Continuation searchContinuation = new Continuation(120); 
        searchContinuation.continuationMethod = contMethodName;
        HttpRequest req = new HttpRequest();
        req.setMethod(method);
        req.setEndpoint(endpoint); 
        req.setBody(requestPayload);
        req.setHeader('content-type','application/json');
        searchContinuation.state = searchContinuation.addHttpRequest(req); 
        requestLabel = searchContinuation.state;
        return searchContinuation;
    }

} 
