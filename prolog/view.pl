/*Exibe Lista na tela recebendo como parâmetro o tamanho da linha e o tamanho da lista*/
exibeNaTela([], TamanhoLinha, NumElementosArray) :- NumElementosArray =:= 0.
exibeNaTela([H|T], TamanhoLinha, NumElementosArray):-
    (H =:= TamanhoLinha**2 ->
        write("X "), write(" "), X2 is NumElementosArray-1, exibeNaTela(T, TamanhoLinha, X2));
    ((NumElementosArray-1) mod (TamanhoLinha)) =:= 0 -> 
        (H < 10 -> write("0")),
        writeln(H), X2 is NumElementosArray-1, exibeNaTela(T, TamanhoLinha, X2);
        

    (H < 10 -> write("0"),write(H),
        write(" "),
        X2 is NumElementosArray-1,
        exibeNaTela(T, TamanhoLinha,X2));

    write(H),
    write(" "),
    X2 is NumElementosArray-1,
    exibeNaTela(T, TamanhoLinha,X2).

exibeNaTela([H|T], TamanhoLinha, NumElementosArray):- (NumElementosArray-1) mod TamanhoLinha =:= 0, (H >= 10 -> writeln(H), X2 is NumElementosArray-1, exibeNaTela(T, TamanhoLinha, X2)).
exibeNaTela([H|T], TamanhoLinha, NumElementosArray):- (H >= 10 -> write(H), X2 is NumElementosArray-1, exibeNaTela(T, TamanhoLinha, X2)).

/*Encapsula exibição de Lista na tela*/
exibeArray([]).
exibeArray(A):- 
    length(A, TamanhoLista),
    exibeNaTela(A,TamanhoLista/integer(sqrt(TamanhoLista)),
    TamanhoLista).

/*Acha elemento pelo indice*/

indiceDoElemento([Elemento|_], Elemento, 0) :- !.
indiceDoElemento([_|Cauda], Elemento, Indice) :-
    indiceDoElemento(Cauda, Elemento, Indice1),
    !,
    Indice is Indice1 + 1.

/*Apagar valor específico*/