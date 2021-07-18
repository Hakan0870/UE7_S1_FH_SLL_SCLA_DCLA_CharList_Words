PROGRAM CharList;

TYPE
    CharNodePtr = ^CharNode;
    CharNode = RECORD
        prev, next: CharNodePtr;
        ch: CHAR;
    END;
    CharListPtr = CharNodePtr;


FUNCTION NewCharList: CharListPtr; (* returns empty CharList *)
VAR
    l: CharListPtr;
BEGIN
    New(l);
    l^.prev := l;
    l^.next := l;
    NewCharList := l;
END;



PROCEDURE DisposeCharList(VAR cl: CharListPtr); (* disposes all nodes and sets cl to NIL *)
VAR
    n, next: CharNodePtr;
BEGIN
    n := cl^.next;
    WHILE n <> cl DO BEGIN
        next := n^.next;
        Dispose(n);
        n := next;
    END;
    Dispose(cl);
END;


FUNCTION CLLength(cl: CharListPtr): INTEGER; (* returns the number of characters in cl *)
VAR
    count: INTEGER;
    n: CharNodePtr;
BEGIN
    n := cl^.next;
    count := 0;
    WHILE n <> cl DO BEGIN
        count := count + 1;
        n := n^.next;
    END;
    CLLength := count;
END;


FUNCTION CLConcat(cl1, cl2: CharListPtr): CharListPtr; (* returns concatenation of cl1 and cl2 by copying the nodes of both lists *)
BEGIN
END;



PROCEDURE ReverseCharList(VAR cl: CharListPtr); (* reverses nodes of cl; e.g. ABC becomes CBA *)
VAR
    invList: CharListPtr;
    n, next: CharNodePtr;
BEGIN
    invList := cl;
    n := cl^.next;
    WHILE n <> cl DO BEGIN
        next := n^.next;
        n^.next := invList;
        invList := n;
        n := next;
    END;
    cl^.next := invList;
END;



FUNCTION IsPalindrom(cl: CharListPtr): BOOLEAN; (* returns whether cl is a palindrom, i.e. a cl that reads the same backwards as forwards e.g. madam *)
BEGIN
END;


FUNCTION CharListOf(s: STRING): CharListPtr; (* returns CharList representation of STRING *)
VAR
    cl, newNode: CharNodePtr;
    n: INTEGER;
BEGIN
    cl := NewCharList;
    FOR n := 1 TO Length(s) DO BEGIN;
        New(newNode);
        newNode^.ch := s[n];
        newNode^.prev := cl^.prev;
        newNode^.next := cl;
        cl^.prev^.next := newNode;
        cl^.prev := newNode;
    END;
    CharListOf := cl;
END;



FUNCTION StringOf(cl: CharListPtr): STRING; (* returns STRING representation of CharList, may result in truncatation *)
VAR
    n: CharNodePtr;
BEGIN
    n := cl^.next;
    WHILE n <> cl DO BEGIN
        Write(n^.ch);
        n := n^.next;
    END;
    WriteLn;
END;





VAR
    cl1, cl2: CharListPtr;
BEGIN
    cl1 := NewCharList;
    cl2 := NewCharList;
    

    cl1 := CharListOf('ABCDEF');
    cl2 := CharListOf('GH');

    StringOf(cl1);
    StringOf(cl2);


    WriteLn('Number of char list 1: ', CLLength(cl1));
    WriteLn('Number of char list 2: ', CLLength(cl2));

    ReverseCharList(cl1);
    ReverseCharList(cl2);
    
    StringOf(cl1);
    StringOf(cl2);


    DisposeCharList(cl1);
    DisposeCharList(cl2);


END.




