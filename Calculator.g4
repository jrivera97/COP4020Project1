grammar Calculator;

@header {
    import java.lang.Math; 
    import java.util.HashMap;
    import java.util.Scanner;
}

@members {
    /* Storage to save variables */
    HashMap<String, HashMap<Integer, Double>> memory = new HashMap<String, HashMap<Integer, Double>>();
    Scanner sc = new Scanner(System.in);
}

prog: stat+ ;

stat: expr NL { if ($expr.i % 1 == 0) { System.out.println((int)$expr.i); } else { System.out.println($expr.i); } }
    | ID '=' e=expr NL {
        if (memory.containsKey($ID.text)) {
            memory.get($ID.text).replace(0, $e.i);
        }
        else {
            HashMap array = new HashMap<Integer, Double>();
            array.put(0, $e.i);
            memory.put($ID.text, array);
        }
    }
    | ID '[' ind=expr ']' '=' e=expr {
        if (memory.containsKey($ID.text)) { // has array
            if (memory.get($ID.text).containsKey($ind.i)) { // has index
                memory.get($ID.text).replace((int)$ind.i, $e.i);
            }
            else {
                memory.get($ID.text).put((int)$ind.i, $e.i);
            }
        }
        else {
            HashMap array = new HashMap<Integer, Double>();
            array.put((int)$ind.i, $e.i);
            memory.put($ID.text, array);
        }
    }
    | '"' ID? '"' NL { System.out.print($ID.text != null? $ID.text : ""); }
    | COMM NL
    | NL
    ;

expr returns [double i]: 
    '(' e=expr ')' { $i = $e.i; }
    | el=expr op=MUL er=expr { $i = $el.i * $er.i; }
    | el=expr op=DIV er=expr { $i = $el.i / $er.i; }
    | el=expr op=SUB er=expr { $i = $el.i - $er.i; }
    | el=expr op=ADD er=expr { $i = $el.i + $er.i; }
    | el=expr op=AND er=expr { $i = (($el.i != 0 ? true : false) && ($er.i != 0 ? true : false)) ? 1 : 0; }
    | el=expr op=OR er=expr { $i = (($el.i != 0 ? true : false) || ($er.i != 0 ? true : false)) ? 1 : 0; }
    | op=NOT el=expr { $i = (!($el.i != 0 ? true : false) ? 1 : 0); }
    | SUB expr { $i = -$expr.i; }
    | INT { $i = Double.valueOf($INT.text); }
    | ID '[' e=expr ']' { $i = memory.containsKey($ID.text) ? (memory.get($ID.text)).get((int)$e.i) : -1; }
    | ID { $i = memory.containsKey($ID.text) ? (memory.get($ID.text).get(0)) : -1; }
    | func {$i = $func.i;}
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
SUB : '-' ;
ADD : '+' ;
EQ : '=' ;

AND : '&&' ;
OR : '||' ;
NOT : '!' ;

COMM : '/*' (.)*? '*/' ;

ID : [_A-Za-z]+ ;
INT : DIGIT+ ('.' DIGIT+)? ;

NL : ( '\r' )? '\n' ;
WS : ( ' ' | '\t' )+ -> skip ;
