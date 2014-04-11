/** FA Engine *********************************************************/

fa:-
	welcome_msg,	read_input(Chars),
	start_state(Start),
	run_FA(Chars, Start, Chars),
	bye_msg.

run_FA([], CurrentState, InputList):-
	halt_state(CurrentState),!,
	accepted_msg(InputList, CurrentState).

run_FA([], CurrentState, InputList):-
	not(halt_state(CurrentState)), !,
	rejected_msg_end(InputList, CurrentState).

run_FA([First|Rest], CurrentState, InputList):-
	trans(CurrentState, First, NextState), !,
	run_FA(Rest, NextState, InputList).

run_FA(Rest, _, InputList):-
	rejected_msg_error(InputList, Rest).

/* IO and display utilities **********************************************/
welcome_msg:-
	nl, write('Welcome to DFA Simulator. Please enter the input. "!" character represents the end of the input.'), nl.

accepted_msg(InputList, HS):-
	chars_to_atom(InputList, String),
	write('"'), write(String), write('"'),
	write('is accepted. Halt state is: "'), write(HS), write('"'), nl.

rejected_msg_end(Input, CS):-
	write('Illegal input! '), nl,
	write('An error at the end of input: cannot reach halt state.'),
	chars_to_atom(Input, String),
	write('Input is: "'), write(String), write('"'), nl,
	write('Finish state is: "'), write(CS), write('"'), nl.

rejected_msg_error(Input, Rest):-
	Rest \== [], !,
	length(Input, L), length(Rest, R),
	Pl is L-R+1,
	chars_to_atom(Input, String),
	write('Illegal input! '), nl,
	write('An error is found at the position '), write(Pl), nl,
	write(String), nl,
	NPl is Pl+6,
	format('~95t ~w~*|~n', ['^ Here ', NPl]).

bye_msg:- write('Bye! (type  fa to restart DFA)'),nl.

itoa([],[]).

itoa([I|R1], [A|R2]):-	name(A,[I]), itoa(R1, R2).

chars_to_atom(Chars, A):- itoa(AsciiList, Chars), atom_codes(A, AsciiList).

read_input(CharList):- read_line(I), I \== end_of_file, !, itoa(I, CharList).

read_line(Chars) :- get0(C), read_rest(C,Chars).

read_rest(33,[]) :- !.

read_rest(10,Chars) :- get0(C1), read_rest(C1,Chars).

read_rest(C,[C|Chars]) :- !, get0(C1), read_rest(C1,Chars).


