grammar Calculator;

@header {
    import java.util.HashMap;
}

@members {
    /* Storage to save variables */
    HashMap<String, Integer> memory = new HashMap();
}

prog: stat+ ;

stat: expr NL {System.out.println($expr.i);}
    | atom NL {System.out.println($atom.i);}
    | COMM
    | NL
    ;


expr returns [int i]: 
    el=expr op=MUL er=expr { $i = $el.i * $er.i; }
    | el=expr op=DIV er=expr { $i = $el.i / $er.i; }
    | el=expr op=ADD er=expr { $i = $el.i + $er.i; }
    | el=expr op=SUB er=expr { $i = $el.i - $er.i; }
    | el=expr op=EQ er=expr {memory.put($el.text, Integer.valueOf($er.i)); System.out.println("I'm here!");}
    | e=atom {System.out.println("im an atom");}
    ;

atom returns [int i]:
    INT { $i = Integer.parseInt($INT.text); }
    | ID { $i = memory.containsKey($ID.text) ? memory.get($ID.text) : -1; }
    | '(' e=expr ')' { $i = $e.i; }
    ;

fragment DIGIT : [0-9] ;

MUL : '*' ;
DIV : '/' ;
ADD : '+' ;
SUB : '-' ;
EQ : '=' ;

COMM : '/*' (.)*? '*/' ; 
VAR : 'var';  // keyword
ID : [_A-Za-z]+ ;
OP : ( MUL | DIV | ADD | SUB ) ;
INT : DIGIT+ ;
NL : ( '\r' )? '\n' ;
WS : ( ' ' | '\t' )+ -> skip ;