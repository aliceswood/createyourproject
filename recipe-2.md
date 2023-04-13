# {{PROBLEM}} Method Design Recipe

Copy this into a `recipe.md` in your project and fill it out.

## 1. Describe the Problem

As a user
So that I can improve my grammar
I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._


```ruby

verified_grammar = grammar_checker(text)

text: a string that we want to check for 2 punctuation situations (start with capital letter and end with a fullstop, exclamation mark or question mark)
verified_grammar: boolean result

```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._



```ruby
grammar_checker("") => fail
grammar_checker("Hello world.") => true
grammar_checker("hello world.") => false
grammar_checker("Hello world") => false
grammar_checker("hello world") => false
grammar_checker("Hello world!") => true
grammar_checker("Hello world?") => true
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---
