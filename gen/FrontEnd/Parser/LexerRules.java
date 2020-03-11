// Generated from /home/jiyi/IdeaProjects/StupidCompiler_v1/src/FrontEnd/Parser/LexerRules.g4 by ANTLR 4.8
package FrontEnd.Parser;
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class LexerRules extends Lexer {
	static { RuntimeMetaData.checkVersion("4.8", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		INT=1, BOOL=2, STRING=3, NULL=4, VOID=5, Bool_constant=6, TRUE=7, FALSE=8, 
		IF=9, ELSE=10, FOR=11, WHILE=12, BREAK=13, CONTINUE=14, RETURN=15, NEW=16, 
		CLASS=17, THIS=18, ID=19, INTEGER=20, STR_constant=21, LINE_COMMENT=22, 
		COMMENT=23, WS=24;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"INT", "BOOL", "STRING", "NULL", "VOID", "Bool_constant", "TRUE", "FALSE", 
			"IF", "ELSE", "FOR", "WHILE", "BREAK", "CONTINUE", "RETURN", "NEW", "CLASS", 
			"THIS", "ID", "INTEGER", "STR_constant", "LINE_COMMENT", "COMMENT", "WS"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'int'", "'bool'", "'string'", "'null'", "'void'", null, "'true'", 
			"'false'", "'if'", "'else'", "'for'", "'while'", "'break'", "'continue'", 
			"'return'", "'new'", "'class'", "'this'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, "INT", "BOOL", "STRING", "NULL", "VOID", "Bool_constant", "TRUE", 
			"FALSE", "IF", "ELSE", "FOR", "WHILE", "BREAK", "CONTINUE", "RETURN", 
			"NEW", "CLASS", "THIS", "ID", "INTEGER", "STR_constant", "LINE_COMMENT", 
			"COMMENT", "WS"
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


	public LexerRules(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "LexerRules.g4"; }

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
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\32\u00d1\b\1\4\2"+
		"\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4"+
		"\13\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22"+
		"\t\22\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31"+
		"\t\31\3\2\3\2\3\2\3\2\3\3\3\3\3\3\3\3\3\3\3\4\3\4\3\4\3\4\3\4\3\4\3\4"+
		"\3\5\3\5\3\5\3\5\3\5\3\6\3\6\3\6\3\6\3\6\3\7\3\7\5\7P\n\7\3\b\3\b\3\b"+
		"\3\b\3\b\3\t\3\t\3\t\3\t\3\t\3\t\3\n\3\n\3\n\3\13\3\13\3\13\3\13\3\13"+
		"\3\f\3\f\3\f\3\f\3\r\3\r\3\r\3\r\3\r\3\r\3\16\3\16\3\16\3\16\3\16\3\16"+
		"\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\20\3\20\3\20\3\20\3\20"+
		"\3\20\3\20\3\21\3\21\3\21\3\21\3\22\3\22\3\22\3\22\3\22\3\22\3\23\3\23"+
		"\3\23\3\23\3\23\3\24\3\24\7\24\u0096\n\24\f\24\16\24\u0099\13\24\3\25"+
		"\3\25\7\25\u009d\n\25\f\25\16\25\u00a0\13\25\3\25\5\25\u00a3\n\25\3\26"+
		"\3\26\3\26\3\26\7\26\u00a9\n\26\f\26\16\26\u00ac\13\26\3\26\3\26\3\27"+
		"\3\27\3\27\3\27\7\27\u00b4\n\27\f\27\16\27\u00b7\13\27\3\27\3\27\3\27"+
		"\3\27\3\30\3\30\3\30\3\30\7\30\u00c1\n\30\f\30\16\30\u00c4\13\30\3\30"+
		"\3\30\3\30\3\30\3\30\3\31\6\31\u00cc\n\31\r\31\16\31\u00cd\3\31\3\31\4"+
		"\u00b5\u00c2\2\32\3\3\5\4\7\5\t\6\13\7\r\b\17\t\21\n\23\13\25\f\27\r\31"+
		"\16\33\17\35\20\37\21!\22#\23%\24\'\25)\26+\27-\30/\31\61\32\3\2\n\4\2"+
		"C\\c|\6\2\62;C\\aac|\3\2\63;\3\2\62;\6\2\f\f\17\17$$^^\5\2$$^^pp\4\2\f"+
		"\f\17\17\5\2\13\f\16\17\"\"\2\u00d9\2\3\3\2\2\2\2\5\3\2\2\2\2\7\3\2\2"+
		"\2\2\t\3\2\2\2\2\13\3\2\2\2\2\r\3\2\2\2\2\17\3\2\2\2\2\21\3\2\2\2\2\23"+
		"\3\2\2\2\2\25\3\2\2\2\2\27\3\2\2\2\2\31\3\2\2\2\2\33\3\2\2\2\2\35\3\2"+
		"\2\2\2\37\3\2\2\2\2!\3\2\2\2\2#\3\2\2\2\2%\3\2\2\2\2\'\3\2\2\2\2)\3\2"+
		"\2\2\2+\3\2\2\2\2-\3\2\2\2\2/\3\2\2\2\2\61\3\2\2\2\3\63\3\2\2\2\5\67\3"+
		"\2\2\2\7<\3\2\2\2\tC\3\2\2\2\13H\3\2\2\2\rO\3\2\2\2\17Q\3\2\2\2\21V\3"+
		"\2\2\2\23\\\3\2\2\2\25_\3\2\2\2\27d\3\2\2\2\31h\3\2\2\2\33n\3\2\2\2\35"+
		"t\3\2\2\2\37}\3\2\2\2!\u0084\3\2\2\2#\u0088\3\2\2\2%\u008e\3\2\2\2\'\u0093"+
		"\3\2\2\2)\u00a2\3\2\2\2+\u00a4\3\2\2\2-\u00af\3\2\2\2/\u00bc\3\2\2\2\61"+
		"\u00cb\3\2\2\2\63\64\7k\2\2\64\65\7p\2\2\65\66\7v\2\2\66\4\3\2\2\2\67"+
		"8\7d\2\289\7q\2\29:\7q\2\2:;\7n\2\2;\6\3\2\2\2<=\7u\2\2=>\7v\2\2>?\7t"+
		"\2\2?@\7k\2\2@A\7p\2\2AB\7i\2\2B\b\3\2\2\2CD\7p\2\2DE\7w\2\2EF\7n\2\2"+
		"FG\7n\2\2G\n\3\2\2\2HI\7x\2\2IJ\7q\2\2JK\7k\2\2KL\7f\2\2L\f\3\2\2\2MP"+
		"\5\17\b\2NP\5\21\t\2OM\3\2\2\2ON\3\2\2\2P\16\3\2\2\2QR\7v\2\2RS\7t\2\2"+
		"ST\7w\2\2TU\7g\2\2U\20\3\2\2\2VW\7h\2\2WX\7c\2\2XY\7n\2\2YZ\7u\2\2Z[\7"+
		"g\2\2[\22\3\2\2\2\\]\7k\2\2]^\7h\2\2^\24\3\2\2\2_`\7g\2\2`a\7n\2\2ab\7"+
		"u\2\2bc\7g\2\2c\26\3\2\2\2de\7h\2\2ef\7q\2\2fg\7t\2\2g\30\3\2\2\2hi\7"+
		"y\2\2ij\7j\2\2jk\7k\2\2kl\7n\2\2lm\7g\2\2m\32\3\2\2\2no\7d\2\2op\7t\2"+
		"\2pq\7g\2\2qr\7c\2\2rs\7m\2\2s\34\3\2\2\2tu\7e\2\2uv\7q\2\2vw\7p\2\2w"+
		"x\7v\2\2xy\7k\2\2yz\7p\2\2z{\7w\2\2{|\7g\2\2|\36\3\2\2\2}~\7t\2\2~\177"+
		"\7g\2\2\177\u0080\7v\2\2\u0080\u0081\7w\2\2\u0081\u0082\7t\2\2\u0082\u0083"+
		"\7p\2\2\u0083 \3\2\2\2\u0084\u0085\7p\2\2\u0085\u0086\7g\2\2\u0086\u0087"+
		"\7y\2\2\u0087\"\3\2\2\2\u0088\u0089\7e\2\2\u0089\u008a\7n\2\2\u008a\u008b"+
		"\7c\2\2\u008b\u008c\7u\2\2\u008c\u008d\7u\2\2\u008d$\3\2\2\2\u008e\u008f"+
		"\7v\2\2\u008f\u0090\7j\2\2\u0090\u0091\7k\2\2\u0091\u0092\7u\2\2\u0092"+
		"&\3\2\2\2\u0093\u0097\t\2\2\2\u0094\u0096\t\3\2\2\u0095\u0094\3\2\2\2"+
		"\u0096\u0099\3\2\2\2\u0097\u0095\3\2\2\2\u0097\u0098\3\2\2\2\u0098(\3"+
		"\2\2\2\u0099\u0097\3\2\2\2\u009a\u009e\t\4\2\2\u009b\u009d\t\5\2\2\u009c"+
		"\u009b\3\2\2\2\u009d\u00a0\3\2\2\2\u009e\u009c\3\2\2\2\u009e\u009f\3\2"+
		"\2\2\u009f\u00a3\3\2\2\2\u00a0\u009e\3\2\2\2\u00a1\u00a3\7\62\2\2\u00a2"+
		"\u009a\3\2\2\2\u00a2\u00a1\3\2\2\2\u00a3*\3\2\2\2\u00a4\u00aa\7$\2\2\u00a5"+
		"\u00a9\n\6\2\2\u00a6\u00a7\7^\2\2\u00a7\u00a9\t\7\2\2\u00a8\u00a5\3\2"+
		"\2\2\u00a8\u00a6\3\2\2\2\u00a9\u00ac\3\2\2\2\u00aa\u00a8\3\2\2\2\u00aa"+
		"\u00ab\3\2\2\2\u00ab\u00ad\3\2\2\2\u00ac\u00aa\3\2\2\2\u00ad\u00ae\7$"+
		"\2\2\u00ae,\3\2\2\2\u00af\u00b0\7\61\2\2\u00b0\u00b1\7\61\2\2\u00b1\u00b5"+
		"\3\2\2\2\u00b2\u00b4\13\2\2\2\u00b3\u00b2\3\2\2\2\u00b4\u00b7\3\2\2\2"+
		"\u00b5\u00b6\3\2\2\2\u00b5\u00b3\3\2\2\2\u00b6\u00b8\3\2\2\2\u00b7\u00b5"+
		"\3\2\2\2\u00b8\u00b9\t\b\2\2\u00b9\u00ba\3\2\2\2\u00ba\u00bb\b\27\2\2"+
		"\u00bb.\3\2\2\2\u00bc\u00bd\7\61\2\2\u00bd\u00be\7,\2\2\u00be\u00c2\3"+
		"\2\2\2\u00bf\u00c1\13\2\2\2\u00c0\u00bf\3\2\2\2\u00c1\u00c4\3\2\2\2\u00c2"+
		"\u00c3\3\2\2\2\u00c2\u00c0\3\2\2\2\u00c3\u00c5\3\2\2\2\u00c4\u00c2\3\2"+
		"\2\2\u00c5\u00c6\7,\2\2\u00c6\u00c7\7\61\2\2\u00c7\u00c8\3\2\2\2\u00c8"+
		"\u00c9\b\30\2\2\u00c9\60\3\2\2\2\u00ca\u00cc\t\t\2\2\u00cb\u00ca\3\2\2"+
		"\2\u00cc\u00cd\3\2\2\2\u00cd\u00cb\3\2\2\2\u00cd\u00ce\3\2\2\2\u00ce\u00cf"+
		"\3\2\2\2\u00cf\u00d0\b\31\2\2\u00d0\62\3\2\2\2\f\2O\u0097\u009e\u00a2"+
		"\u00a8\u00aa\u00b5\u00c2\u00cd\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}