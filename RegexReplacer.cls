public class RegexReplacer {

    // Declaring a class to handle the inputs
    public class ReplacementRequest {
        @InvocableVariable(label='Input String' required=true)
        public String inputString;
        
        @InvocableVariable(label='Regex Pattern' required=true)
        public String regexPattern;
        
        @InvocableVariable(label='Replacement Value' required=false) // Not required. If left blank, input string will be removed.
        public String replacementValue;
    }

    // Declaring a class to handle the outputs
    public class ReplacementResult {
        @InvocableVariable(label='Output String')
        public String outputString;
    }

    @InvocableMethod(label='Replace String via Regex')
    public static List<ReplacementResult> replaceText(List<ReplacementRequest> requests) {
        List<ReplacementResult> results = new List<ReplacementResult>();

        for (ReplacementRequest request : requests) {
            // Create a new instance of the output object 
            ReplacementResult result = new ReplacementResult();
            
            // Handling null replacementValue by defaulting to empty string
            String actualReplacementValue = (request.replacementValue != null) ? request.replacementValue : '';
            
            // Regex replace operation with the adjusted replacement value
            result.outputString = request.inputString.replaceAll(request.regexPattern, actualReplacementValue);
            
            // Add the result to the list
            results.add(result);
        }
        
        return results;
    }
}
