# COP4020Project1

## Parts needed to implement
   1. Comments: /* ... */
   2. Basic expressions with variables
   3. Boolean Expressions
   4. Precedence
   5. Special Expression: read and sqrt
   6. Statements: expressions (print value on the screen when executed), print expressions
   7. Math library functions: s, c, l, e (no need for a and j)
### Parts Implented: All of them

## How to run the code with a test file (through grun testing rig)

This code was made to run with the grun testing rig. In order to run the code with our test files, please make sure you have Java, Antlr4(and grun) installed in your terminal, or the terminal of vscode. Clone this repo then type the following commands:\n
  
  ```java 
  $ antlr4 Calculator.g4
  $ javac Calculator*.java
  $ grun Calculator prog simpleTests.txt
  ```

In order to run with a different test file, simply make a new .txt with test cases and use that file name instead of simpleTests.txt.

## Run the code with terminal input
To run the code without a test file and instead use dynamic input, do the following commands in the terminal:
  ```
  $ antlr4 Calculator.g4
  $ javac Calculator*.java
  $ grun Calculator prog
  $ <input of expressions, variables, new lines, etc>
  $ CTRL+D (for Mac)
  $ CTRL+Z (for Windows)
  ```
Make sure to only push CTRL+D once you've finished inserting all your input only do it on a new line. You can also use the flags -tokens, -gui, and -tree to further evaluate the results shown by the calculator.
  
  
