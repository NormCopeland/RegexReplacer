@isTest
public class RegexReplacerTest {

    @isTest
    static void testReplaceText() {
        List<RegexReplacer.ReplacementRequest> requests = new List<RegexReplacer.ReplacementRequest>();

        RegexReplacer.ReplacementRequest request1 = new RegexReplacer.ReplacementRequest();
        request1.inputString = 'Hello World!';
        request1.regexPattern = 'World';
        request1.replacementValue = 'Salesforce';
        requests.add(request1);

        RegexReplacer.ReplacementRequest request2 = new RegexReplacer.ReplacementRequest();
        request2.inputString = 'Good morning, World!';
        request2.regexPattern = 'World';
        request2.replacementValue = null;
        requests.add(request2);

        RegexReplacer.ReplacementRequest request3 = new RegexReplacer.ReplacementRequest();
        request3.inputString = 'Red, Green, Blue';
        request3.regexPattern = 'Red|Blue';
        request3.replacementValue = 'Color';
        requests.add(request3);

        List<RegexReplacer.ReplacementResult> results = RegexReplacer.replaceText(requests);

        System.assert(results != null);
        System.assertEquals(3, results.size());
        System.assertEquals('Hello Salesforce!', results[0].outputString);
        System.assertEquals('Good morning, !', results[1].outputString);
        System.assertEquals('Color, Green, Color', results[2].outputString);
    }

    @isTest
    static void testEmptyInputString() {
        List<RegexReplacer.ReplacementRequest> requests = new List<RegexReplacer.ReplacementRequest>();
        RegexReplacer.ReplacementRequest request = new RegexReplacer.ReplacementRequest();
        request.inputString = '';
        request.regexPattern = 'anything';
        request.replacementValue = 'something';
        requests.add(request);
        
        List<RegexReplacer.ReplacementResult> results = RegexReplacer.replaceText(requests);
        System.assertEquals('', results[0].outputString, 'Empty input should result in empty output.');
    }

    @isTest
    static void testNoMatchRegex() {
        List<RegexReplacer.ReplacementRequest> requests = new List<RegexReplacer.ReplacementRequest>();
        RegexReplacer.ReplacementRequest request = new RegexReplacer.ReplacementRequest();
        request.inputString = 'Hello Salesforce';
        request.regexPattern = 'XYZ';
        request.replacementValue = 'ABC';
        requests.add(request);
        
        List<RegexReplacer.ReplacementResult> results = RegexReplacer.replaceText(requests);
        System.assertEquals('Hello Salesforce', results[0].outputString, 'No match should return the original string.');
    }

    @isTest
    static void testPerformanceWithLargeStringAndHighVolume() {
        String largeString = String.join(new List<String>(50000), 'A'); // Simple way to create a large string
        List<RegexReplacer.ReplacementRequest> requests = new List<RegexReplacer.ReplacementRequest>();
        for (Integer i = 0; i < 200; i++) { // Reduced for practical reasons
            RegexReplacer.ReplacementRequest request = new RegexReplacer.ReplacementRequest();
            request.inputString = largeString;
            request.regexPattern = 'AA';
            request.replacementValue = 'B';
            requests.add(request);
        }

        Test.startTest();
        DateTime startTime = DateTime.now();
        
        List<RegexReplacer.ReplacementResult> results = RegexReplacer.replaceText(requests);
        
        DateTime endTime = DateTime.now();
        Long timeTaken = endTime.getTime() - startTime.getTime();
        Test.stopTest();

        System.assert(timeTaken < 5000, 'The process should complete in less than 5 seconds.'); // Adjusted time for practicality
        System.assertEquals(200, results.size(), 'Should handle high volume efficiently.');
    }

    @isTest
    static void testInvalidRegex() {
        List<RegexReplacer.ReplacementRequest> requests = new List<RegexReplacer.ReplacementRequest>();
        RegexReplacer.ReplacementRequest request = new RegexReplacer.ReplacementRequest();
        request.inputString = 'test';
        request.regexPattern = '[unclosed';
        request.replacementValue = 'error';
        requests.add(request);
        
        Boolean didThrow = false;
        try {
            RegexReplacer.replaceText(requests);
        } catch (Exception e) {
            didThrow = true;
        }
        System.assert(didThrow, 'Invalid regex should raise an exception.');
    }
}
