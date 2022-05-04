subset([], []).
subset([_|Set], Subset) :- subset(Set, Subset).
subset([S|Set], [S|Subset]) :- subset(Set, Subset).
