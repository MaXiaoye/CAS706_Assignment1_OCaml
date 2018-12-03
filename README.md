# CAS706_Assignment1_OCaml

Assignment 1
Generic Quicksort. Write 3 different versions of quicksort (in each language), which explicitly:

Sort a list of integers in ascending order
Sorts a list of ``anything'' via an externally provided comparison function.
Sorts a list of ``anything'' via an externally provided comparison function, and an externally provided partition function (which itself uses the comparison function).

Key functions:

partitionOne:  No external comparision function
partitionTwo:  Uses external comparision function

quicksortOne list: No external comparision function
quicksortTwo comparision list: Uses external comparision function Where comparision is external function. Such as compareAsc
quicksortThree partition comparision list: Where partition is external partition function(partitionTwo in my test cases).
E.g.
quicksortThree partitionTwo compareStr list4 |> print_list

Please just compile and run quicksort.ml
Test cases below:

List1 is 
1 4 3 2 2 3 6 4 2 -1
Sorted list1 in ascending order is 
-1 1 2 2 2 3 3 4 4 6

List2 is 
1 2 3 4 5 6 7 8 9 10
Sorted list2 in descending order is 
10 9 8 7 6 5 4 3 2 1

List3 is 
asd ctvg bfdry zszhu xb ywd 

Sorted list3 in alphabetical order is 
asd bfdry ctvg xb ywd zszhu 

Sorted list3 in length descending order is 
bfdry zszhu ctvg ywd asd xb 
