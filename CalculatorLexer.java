// Generated from Calculator.g4 by ANTLR 4.7.2

    import java.util.HashMap;

import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class CalculatorLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.7.2", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, MUL=3, DIV=4, ADD=5, SUB=6, EQ=7, COMM=8, VAR=9, ID=10, 
		OP=11, INT=12, NL=13, WS=14;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"T__0", "T__1", "DIGIT", "MUL", "DIV", "ADD", "SUB", "EQ", "COMM", "VAR", 
			"ID", "OP", "INT", "NL", "WS"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'('", "')'", "'*'", "'/'", "'+'", "'-'", "'='", null, "'var'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, "MUL", "DIV", "ADD", "SUB", "EQ", "COMM", "VAR", "ID", 
			"OP", "INT", "NL", "WS"
		};
	}
	private static final String[] _SYMBOLIC_NAMES = makeSymbolicNames();
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}


	    /* Storage to save variables */
	    HashMap<String, Integer> memory = new HashMap();


	public CalculatorLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "Calculator.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public String[] getChannelNames() { return channelNames; }

	@Override
	public String[] getModeNames() { return modeNames; }

	@Override
	public ATN getATN() { return _ATN; }

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\20]\b\1\4\2\t\2\4"+
		"\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t"+
		"\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\3\2\3\2\3\3\3\3\3\4"+
		"\3\4\3\5\3\5\3\6\3\6\3\7\3\7\3\b\3\b\3\t\3\t\3\n\3\n\3\n\3\n\7\n\66\n"+
		"\n\f\n\16\n9\13\n\3\n\3\n\3\n\3\13\3\13\3\13\3\13\3\f\6\fC\n\f\r\f\16"+
		"\fD\3\r\3\r\3\r\3\r\5\rK\n\r\3\16\6\16N\n\16\r\16\16\16O\3\17\5\17S\n"+
		"\17\3\17\3\17\3\20\6\20X\n\20\r\20\16\20Y\3\20\3\20\3\67\2\21\3\3\5\4"+
		"\7\2\t\5\13\6\r\7\17\b\21\t\23\n\25\13\27\f\31\r\33\16\35\17\37\20\3\2"+
		"\5\3\2\62;\5\2C\\aac|\4\2\13\13\"\"\2c\2\3\3\2\2\2\2\5\3\2\2\2\2\t\3\2"+
		"\2\2\2\13\3\2\2\2\2\r\3\2\2\2\2\17\3\2\2\2\2\21\3\2\2\2\2\23\3\2\2\2\2"+
		"\25\3\2\2\2\2\27\3\2\2\2\2\31\3\2\2\2\2\33\3\2\2\2\2\35\3\2\2\2\2\37\3"+
		"\2\2\2\3!\3\2\2\2\5#\3\2\2\2\7%\3\2\2\2\t\'\3\2\2\2\13)\3\2\2\2\r+\3\2"+
		"\2\2\17-\3\2\2\2\21/\3\2\2\2\23\61\3\2\2\2\25=\3\2\2\2\27B\3\2\2\2\31"+
		"J\3\2\2\2\33M\3\2\2\2\35R\3\2\2\2\37W\3\2\2\2!\"\7*\2\2\"\4\3\2\2\2#$"+
		"\7+\2\2$\6\3\2\2\2%&\t\2\2\2&\b\3\2\2\2\'(\7,\2\2(\n\3\2\2\2)*\7\61\2"+
		"\2*\f\3\2\2\2+,\7-\2\2,\16\3\2\2\2-.\7/\2\2.\20\3\2\2\2/\60\7?\2\2\60"+
		"\22\3\2\2\2\61\62\7\61\2\2\62\63\7,\2\2\63\67\3\2\2\2\64\66\13\2\2\2\65"+
		"\64\3\2\2\2\669\3\2\2\2\678\3\2\2\2\67\65\3\2\2\28:\3\2\2\29\67\3\2\2"+
		"\2:;\7,\2\2;<\7\61\2\2<\24\3\2\2\2=>\7x\2\2>?\7c\2\2?@\7t\2\2@\26\3\2"+
		"\2\2AC\t\3\2\2BA\3\2\2\2CD\3\2\2\2DB\3\2\2\2DE\3\2\2\2E\30\3\2\2\2FK\5"+
		"\t\5\2GK\5\13\6\2HK\5\r\7\2IK\5\17\b\2JF\3\2\2\2JG\3\2\2\2JH\3\2\2\2J"+
		"I\3\2\2\2K\32\3\2\2\2LN\5\7\4\2ML\3\2\2\2NO\3\2\2\2OM\3\2\2\2OP\3\2\2"+
		"\2P\34\3\2\2\2QS\7\17\2\2RQ\3\2\2\2RS\3\2\2\2ST\3\2\2\2TU\7\f\2\2U\36"+
		"\3\2\2\2VX\t\4\2\2WV\3\2\2\2XY\3\2\2\2YW\3\2\2\2YZ\3\2\2\2Z[\3\2\2\2["+
		"\\\b\20\2\2\\ \3\2\2\2\t\2\67DJORY\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}