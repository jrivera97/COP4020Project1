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
    | COMM NL
    | NL
    ;


expr returns [int i]: 
    el=expr op=MUL er=expr { $i = $el.i * $er.i; }
    | el=expr op=DIV er=expr { $i = $el.i / $er.i; }
    | el=expr op=ADD er=expr { $i = $el.i + $er.i; }
    | el=expr op=SUB er=expr { $i = $el.i - $er.i; }
    | el=expr op=AND er=expr { $i = (($el.i != 0 ? true : false) && ($er.i != 0 ? true : false)) ? 1 : 0; }
    | el=expr op=OR er=expr { $i = (($el.i != 0 ? true : false) || ($er.i != 0 ? true : false)) ? 1 : 0; }
    | op=NOT el=expr { $i = (!($el.i != 0 ? true : false) ? 1 : 0); }
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

AND : '&&' ;
OR : '||' ;
NOT : '!' ;

COMM : '/*' (.)*? '*/' ;

ID : [_A-Za-z]+ ;
INT : DIGIT+ ;

NL : ( '\r' )? '\n' ;
WS : ( ' ' | '\t' )+ -> skip ;