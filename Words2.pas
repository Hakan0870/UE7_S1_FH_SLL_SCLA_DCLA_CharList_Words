PROGRAM Words2;

TYPE
    WordNodePtr = ^WordNode;
    WordNode = RECORD
        prev, next: WordNodePtr;
        word: STRING;
        n: INTEGER; //frequency of word
    END;
    WordListPtr = WordNodePtr;


PROCEDURE InitList(VAR l: WordListPtr);
BEGIN
    New(l);
    l^.prev := l;
    l^.next := l;
END;


PROCEDURE DisposeList(VAR l: WordListPtr);
VAR
    n, nextN: WordNodePtr;
BEGIN
    n := l^.next;
    WHILE n <> l DO BEGIN
        nextN := n^.next;
        Dispose(n);
        n := nextN;
    END;
    Dispose(l);
END;


PROCEDURE Addvalue(VAR l: WordListPtr; value: STRING);
VAR
    n, newN: WordNodePtr;
BEGIN
    New(newN);
    newN^.n := 1;
    newN^.word := value;
    newN^.prev := l^.prev;
    newN^.next := l;
    l^.prev^.next := newN;
    l^.prev := newN;

    n := l^.next;
    WHILE n^.next <> l DO BEGIN
        IF n^.word = value THEN
        newN^.n := newN^.n + 1;
        n := n^.next
    END;
END;


PROCEDURE DisplayList(l: WordListPtr);
VAR
    n: WordNodePtr;
BEGIN
    n := l^.next;
    WHILE n <> l DO BEGIN
        WriteLn(n^.word, ' ','  n=', n^.n);
        n := n^.next;
    END;
END;



VAR
    l: WordListPtr;

BEGIN
    InitList(l);

    Addvalue(l, 'hallo');
    Addvalue(l, 'hallo');
    Addvalue(l, 'halla');
    Addvalue(l, 'hallo');
    Addvalue(l, 'hallo');
    Addvalue(l, 'hallo');
    Addvalue(l, 'hallo');
    Addvalue(l, 'hallo');
    Addvalue(l, 'hallo');
    Addvalue(l, 'hallo');
    Addvalue(l, 'hallo');
    Addvalue(l, 'hallo');
    Addvalue(l, 'hallo');
    



    DisplayList(l);

    DisposeList(l);
END. 