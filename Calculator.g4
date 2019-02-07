grammar Calculator;

@header {
    import java.lang.Math; 
    import java.util.HashMap;
    import java.util.Scanner;
}

@members {
    /* Storage to save variables */
    HashMap<String, Integer> memory = new HashMap();
    Scanner sc = new Scanner(System.in);
}

prog: stat+ ;

stat: expr NL { if ($expr.i % 1 == 0) { System.out.println((int)$expr.i); } else { System.out.println($expr.i); } }
    | ID '=' expr NL { memory.put($ID.text, (int)$expr.i); }
    | '"' ID? '"' NL { System.out.print($ID.text != null? $ID.text : ""); }
    | COMM NL
    | NL
    ;

expr returns [double i]: 
    '(' e=expr ')' { $i = $e.i; }
    | el=expr op=MUL er=expr { $i = $el.i * $er.i; }
    | el=expr op=DIV er=expr { $i = $el.i / $er.i; }
    | el=expr op=ADD er=expr { $i = $el.i + $er.i; }
    | el=expr op=SUB er=expr { $i = $el.i - $er.i; }
    | el=expr op=AND er=expr { $i = (($el.i != 0 ? true : false) && ($er.i != 0 ? true : false)) ? 1 : 0; }
    | el=expr op=OR er=expr { $i = (($el.i != 0 ? true : false) || ($er.i != 0 ? true : false)) ? 1 : 0; }
    | op=NOT el=expr { $i = (!($el.i != 0 ? true : false) ? 1 : 0); }
    | func {$i = $func.i;}
    | SUB expr { $i = -$expr.i; }
    | INT { $i = Integer.parseInt($INT.text); }
    | ID { $i = memory.containsKey($ID.text) ? memory.get($ID.text) : -1; }
    ;

func returns [double i]:
    f=READ '()' { $i = sc.nextInt(); }
    | f=PRINT '(' a=expr ')' { $i = $a.i; }
    | f=SQRT'(' a=expr ')' { $i = Math.sqrt($a.i); }
    | f=SIN'(' a=expr ')' { $i = Math.sin($a.i); }
    | f=COS'(' a=expr ')' { $i = Math.cos($a.i); }
    | f=EX '(' a=expr ')' { $i = Math.exp($a.i); }
    | f=LN '(' a=expr ')' { $i = Math.log($a.i); }
    ;

fragment DIGIT : [0-9] ;

READ : 'read' ;
SQRT : 'sqrt' ;
PRINT : 'print' ;
EX : 'e';
COS : 'c';
SIN : 's';
LN : 'l';

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

