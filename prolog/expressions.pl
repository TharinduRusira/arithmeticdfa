:- [engine].

start_state(start).% start = q0
halt_state(q1).
halt_state(q3).

% transition declaration

trans(start, X, q1):- is_digit(X).
trans(q1, X, q1):- is_digit(X).
trans(q1, X, start):- is_plus(X);is_minus(X);is_multi(X);is_division(X).
trans(start, X,start):- is_plus(X);is_minus(X).
trans(start, X, q2):- is_decimal(X).
trans(q1, X, q2):- is_decimal(X).
trans(q2,X,q3) :- is_digit(X).
trans(q3,X,q3) :- is_digit(X).
trans(q3,X,start) :- is_plus(X);is_minus(X);is_multi(X);is_division(X).

% Symbol declarations

is_digit(X):-
	X=0;X=1;X=2;X=3;X=4;X=5;X=6;X=7;X=8;X=9.

is_plus(X):- X = '+'.
is_minus(X):- X = '-'.
is_multi(X):- X = '*'.
is_division(X):- X = '/'.
is_decimal(X) :- X='.'.


