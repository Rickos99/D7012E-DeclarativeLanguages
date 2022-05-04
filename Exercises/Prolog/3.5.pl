:- ["L11", "3.4"].

palindrome( List) :- reverse(List, ReversedList), List = ReversedList.
