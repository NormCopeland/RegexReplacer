# RegexReplacer Apex Class for Salesforce

The `RegexReplacer` class is an invocable Apex class designed to perform regex-based string replacements within Salesforce. This functionality is packaged into an easily accessible form for use within Salesforce Flows, allowing automated processes to manipulate string data based on dynamic regex patterns and replacement values.

## Features

-  **Invocable Method**: The class exposes an invocable method `replaceText`, which can be used directly within Salesforce Flows or called from Apex.
-  **Dynamic Input and Replacement**: Users can specify the input string, regex pattern, and replacement string dynamically, making this highly adaptable for various text processing needs.
-  **Batch Processing**: The method accepts and processes a list of requests in a single call, thereby optimizing for performance and ease of use in larger data sets.

## Components

This repository contains two main components:

1. **RegexReplacer Apex Class**: The core class that includes the functionality for regex-based text replacement.
2. **RegexReplacerTest Apex Test Class**: Provides a comprehensive suite of unit tests that validate the functionality of the `RegexReplacer` class, ensuring reliability through various typical and edge-case scenarios.

## Using the RegexReplacer in a Salesforce Flow

The `RegexReplacer` class is designed to be easily integrated into Salesforce Flows. Below is a step-by-step guide on how to use it:

### Step 1: Setup Invocable Method

The class contains an `@InvocableMethod` which can be used directly in Flows. In your Flow, you will need to:

-  Navigate to the Flows section in Salesforce Setup.
-  Create a new Flow or edit an existing one.
-  In your Flow, add an Action element.
-  Search for the `replaceText` Action provided by the `RegexReplacer` class.

### Step 2: Configure Action Parameters

Configure the Action with the necessary parameters:

-  **Input String**: The text in which the replacements are to be made.
-  **Regex Pattern**: The regex pattern to match in the input string.
-  **Replacement Value**: The text that will replace each match found (can be left empty to remove matches).

### Step 3: Use the Output

The output of the `replaceText` method is a collection of results which you can then use within your Flow to update records, send notifications, or perform other logic.

## Testing

The `RegexReplacerTest` class includes several test methods that cover a wide range of cases:

-  Basic replacements
-  Null and empty inputs
-  Performance testing with large datasets
-  Malformed regex patterns

Simply deploy this class along with the main class and execute the tests via Salesforce's built-in test execution tools to ensure the functionality operates as expected.
