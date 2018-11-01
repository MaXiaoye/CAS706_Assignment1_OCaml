(*Print function for list of int*)
let printInt lst =
    List.map string_of_int lst
        |> String.concat " "
        |> print_endline
;;

(*Print function for list of string*)
let rec print_list = function 
[] -> ()
| e::l -> print_string e ; print_string " " ; print_list l

(*"old" quicksort function*)
let rec quicksort list =
  match list with
  | [] -> [] (*Return if list is empty or contains single number*)
  | [x] -> [x]
  | pivot::rest -> (*Select the first number as pivot and begin partition*)
      let rec partition left right list =
        match list with 
        | [] -> quicksort left @ (pivot :: quicksort right) (*If list is empty, that means partition is done, then quicksort left and right, then appending*)
        | head::tail -> if head < pivot then partition (head::left) right tail (*Partition is not done so that put number less than pivot into left, and put the bigger ones into right, then rec partition*)
                                         else partition left (head::right) tail
      in partition [] [] rest;;
 
(*partition function one, no external comparision function*)
let rec partitionOne pivot left right list =
	match list with 
        | [] -> left,right (*If list is empty, that means partition is done, then quicksort left and right, then appending*)
        | head::tail -> if head < pivot then partitionOne pivot (head::left) right tail (*Partition is not done so that put number less than pivot into left, and put the bigger ones into right, then rec partition*)
                                         else partitionOne pivot left (head::right) tail;;

(*partition function two, uses external comparision function*)
let rec partitionTwo comparision pivot left right list =
	match list with 
        | [] -> left,right 
        | head::tail -> if comparision head pivot then partitionTwo comparision pivot (head::left) right tail
                                         else partitionTwo comparision pivot left (head::right) tail;;

(*quicksort function one, no external comparision function*)
let rec quicksortOne list =
	match list with
  | [] -> []
  | pivot::xs -> (*pick up the first element as pivot, do partition to get left and right part, then do recursively sort for left and right parts.*)
      let ys, zs = partitionOne pivot [] [] xs in
      (quicksortOne ys) @ (pivot :: (quicksortOne zs));;

(*quicksort function two, uses external comparision function*)
let rec quicksortTwo comparision list =
	match list with
  | [] -> []
  | pivot::xs ->
      let ys, zs = partitionTwo comparision pivot [] [] xs in
      (quicksortTwo comparision ys) @ (pivot :: (quicksortTwo comparision zs));;	

(*quicksort function Three, uses external comparision and partition functions*)
let rec quicksortThree partition comparision list =
	match list with
  | [] -> []
  | pivot::xs ->
      let ys, zs = partition comparision pivot [] [] xs in
      (quicksortThree partition comparision ys) @ (pivot :: (quicksortThree partition comparision zs));;	

(*ascending comparision*)
let compareAsc arg1 arg2 = if arg1 < arg2 then true else false;;
(*descending comparision*)
let compareDesc arg1 arg2 = if arg1 >= arg2 then true else false;;
(*length in descending order comparision for string*)
let compareStr arg1 arg2 = if String.length arg1 >= String.length arg2 then true else false;;

(*test cases*)
let list1 = [1;4;3;2;2;3;6;4;2;-1];;
print_string "\nList1 is \n";;
list1 |>printInt;;
print_string "Sorted list1 in ascending order is \n";;
quicksortOne list1 |> printInt;;

let list2 = [1;2;3;4;5;6;7;8;9;10];;
print_string "\nList2 is \n";;
list2 |>printInt;;
print_string "Sorted list2 in descending order is \n";;
quicksortTwo compareDesc list2 |> printInt;;

let list3 = ["asd";"ctvg";"bfdry";"zszhu";"xb";"ywd"];;
print_string "\nList3 is \n";;
print_list list3;;
print_string "\n";;
print_string "\nSorted list3 in alphabetical order is \n";;
quicksortThree partitionTwo compareAsc list3 |> print_list;;
print_string "\n";;
let list4 = ["asd";"ctvg";"bfdry";"zszhu";"xb";"ywd"];;
print_string "\nSorted list3 in length descending order is \n";;
quicksortThree partitionTwo compareStr list4 |> print_list;;