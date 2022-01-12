/*------------------Somme d'une polynome------------------*/
polynomeSomme([],Somme,Somme) :- !.

polynomeSomme(Somme,[],Somme) :- !.

polynomeSomme([H1 | T1], [H2 | T2], [HSomme | TSomme]) :-
    HSomme is H1 + H2,
    polynomeSomme(T1, T2, TSomme).

/*------------------Soustraction d'une polynome------------------*/
polynomeSoustraction(Soust,[],Soust):- !.

polynomeSoustraction([],[H | T],[HSoust | TSoust]):- !,
    HSoust is - H,
    polynomeSoustraction([], T ,TSoust).

polynomeSoustraction([H1 | T1],[H2 | T2],[HSoust | TSoust]):-
    HSoust is H1 - H2,
    polynomeSoustraction(T1 , T2 ,TSoust).
/*------------------Produit d'une polynome------------------*/
polynomeProduit([C1], [C2], [P]) :- !,
    P is C1 * C2.

polynomeProduit([C], [H | T1], [HProduit | T]) :-!,
    HProduit is C * H,
    polynomeProduit([C], T1, T).

polynomeProduit([H | T], Polynome, Produit) :-
    polynomeProduit([H],Polynome,Add1),
    polynomeProduit(T,[0 | Polynome], Add2),
    polynomeSomme(Add1, Add2, Produit).

/*------------------Derivee d'une polynome------------------*/
polynomeDerive([],[]) :- !.
polynomeDerive([H|T],D) :-
    length(T , K),
    S is H * K,
    polynomeDerive(T,R),
    append([S],R,D).

polynome_power([],0,[]) :- !.
polynome_power(L,N,D) :-
    polynome_produit(L,L,D),
    A = N - 1,
    polynome_power(L,A,D).

/*------------------Afficher d'une polynome------------------*/

ecrire(X,0) :-!,
    write(' + '),
    write(X).

ecrire(X,P) :-
    write(' + '),
    write('('),
    write(X),
    write('x^'),
    write(P),
    write(')').

afficher([X]) :-
    ecrire(X,0).
afficher([H|T]):-
    length(T,P),
    ecrire(H,P),
    afficher(T),
    !.
