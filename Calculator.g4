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
    | ID '=' expr NL {memory.put($ID.text, Integer.valueOf($expr.i));}
    | COMM
    | NL
    ;


expr returns [int i]: 
    el=expr op=MUL er=expr { $i = $el.i * $er.i; }
    | el=expr op=DIV er=expr { $i = $el.i / $er.i; }
    | el=expr op=ADD er=expr { $i = $el.i + $er.i; }
    | el=expr op=SUB er=expr { $i = $el.i - $er.i; }
    | INT { $i = Integer.parseInt($INT.text); }
    | ID { $i = memory.containsKey($ID.text) ? memory.get($ID.text) : -1; }
    | '(' e=expr ')' { $i = $e.i; }
    ;

fragment DIGIT : [0-9] ;

MUL : '*' ;
DIV : '/' ;
ADD : '+' ;
SUB : '-' ;
EQ : '=' ;
OP : ( MUL | DIV | ADD | SUB ) ;

NOT : '!' ;
AND : '&&' ;
OR : '||' ;
BOOL_OP: ( AND | OR ) ;

COMM : '/*' (.)*? '*/' ;

ID : [_A-Za-z]+ ;
INT : DIGIT+ ;

NL : ( '\r' )? '\n' ;
WS : ( ' ' | '\t' )+ -> skip ;