conc([], L, L).
conc([X| L1], L2, [X| L3]) :- conc(L1, L2, L3).

init(List, Init) :- conc(Init, [_], List).
% ?- init([1,2,3,4], I).
% I = [1,2,3].

sum([], 0).
sum([L|List], Sum) :- sum(List, S), Sum is L + S.

%% Create subsets %%
create_subsets([], _, _, []).
create_subsets([L|List], I, J, Subsets) :- 
  Inext is I + 1,
  create_subsets_aux([L|List], I, J, SB), 
  create_subsets(List, Inext, J, S),
  conc(S, SB, Subsets).

create_subsets_aux([], _, _, []).
create_subsets_aux(List, I, J, [subset(Sum, I, J, List)|Subsets]) :-
  Jprev is J - 1,
  sum(List, Sum),
  init(List, Init),
  create_subsets_aux(Init, I, Jprev, Subsets).

%% Select k number of sets and print them %%
smallest_k_sets(List, K) :- 
  length(List, J1),
  J is J1 - 1,
  create_subsets(List, 0, J, Sets),
  msort(Sets, SortedSets),
  select_k_sets(SortedSets, K, KSets),
  print(KSets).

select_k_sets([], _, []).
select_k_sets(_, 0, []).
select_k_sets([L|List], K, [L|KSets]) :-
  K > 0,
  KNext is K - 1,
  select_k_sets(List, KNext, KSets).

%% Print sets %%
print(Sets) :-
  write_ln("size\ti\tj\tsublist"),
  print_set(Sets).
  
print_set([]).
print_set([subset(Sum, I, J, Set)|Sets]) :-
  write(Sum), write("\t"),
  write(I), write("\t"),
  write(J), write("\t"),
  write(Set), write("\n"),
  print_set(Sets).
