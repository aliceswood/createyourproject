# {{PROBLEM}} Method Design Recipe

Copy this into a `recipe.md` in your project and fill it out.

## 1. Describe the Problem

As a user
So that I can improve my grammar
I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

verified_grammar = grammar_checker(text)

text: a string that we want to check for 2 punctuation situations (start with capital letter and end with a fullstop, exclamation mark or question mark)
verified_grammar: boolean result

```ruby
# EXAMPLE

# `extract_upper` extracts uppercase words from a string
uppercase_words = extract_uppercase(mixed_words)

mixed_words: a string (e.g. "hello WORLD")
uppercase_words: a list of strings (e.g. ["WORLD"])

# The method doesn't print anything or have any other side-effects
```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

grammar_checker("") => fail
grammar_checker("Hello world.") => true
grammar_checker("hello world.") => false
grammar_checker("Hello world") => false
grammar_checker("hello world") => false
grammar_checker("Hello world!") => true
grammar_checker("Hello world?") => true

```ruby
# EXAMPLE

extract_uppercase("hello WORLD") => ["WORLD"]
extract_uppercase("HELLO WORLD") => ["HELLO", "WORLD"]
extract_uppercase("hello world") => []
extract_uppercase("hello WoRLD") => []
extract_uppercase("hello WORLD!") => ["WORLD"]
extract_uppercase("") => []
extract_uppercase(nil) throws an error
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---
