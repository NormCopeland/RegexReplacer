# RegexReplacer Apex Class for Salesforce

The `RegexReplacer` is an Apex class that makes it easy to swap out text in Salesforce using regex patterns. It’s built to be used in Salesforce Flows, so you can automate text changes on the fly with whatever patterns and replacements you need.

## How to Use It in Salesforce Flow

Getting `RegexReplacer` up and running in a Salesforce Flow is pretty straightforward.

### Step 1: Set Up the Invocable Method

-  Navigate to the Flows section in Salesforce Setup.
-  Create a new Flow or edit an existing one.
-  In your Flow, add an Action element.
-  Search for the `Replace String via Regex` Action provided by the `RegexReplacer` class.

### Step 2: Set the Action Parameters

You’ll need to fill in a few details:

-   **Input String**: The text you’re looking to change.
-   **Regex Pattern**: The pattern to find the text you want to swap out.
-   **Replacement Value**: What you want to put in its place (leave it empty if you just want to get rid of the matched text).

### Step 3: Do Something With the Results

Whatever comes out of the `replaceText` method, you can use it to update records, send alerts, or whatever else you need to do in your Flow.

## Testing

The `RegexReplacerTest` test class covers:

-   Simple text swaps.
-   What happens when inputs are null or empty.
-   Checking performance with lots of data.
-   Dealing with regex patterns that don’t make sense.

Make sure to deploy this test class with the main class and run all the tests to make sure you’re good to go.
