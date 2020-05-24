package IR;

import IR.Operand.ConstString;
import IR.Operand.Variable;

import java.util.HashMap;
import java.util.Map;

public class Module {
    Map<String, Function> globalFuncMap;
    Map<String, ConstString> stringPool;
    Map<String, Variable> globalVar;

    public Module() {
        globalFuncMap = new HashMap<String, Function>();
        stringPool = new HashMap<String, ConstString>();
        globalVar = new HashMap<String, Variable>();
        globalFuncMap.put("stringAdd", builtinStringAdd);
    }

    public void addGlobalVar(Variable variable) {
        globalVar.put(variable.getName(), variable);
    }

    public void addGlobalFunc(String name, Function func) {
        globalFuncMap.put(name, func);
    }

    public ConstString getConstString(String key) {
        return stringPool.get(key);
    }

    public void addConstString(ConstString oper) {
        stringPool.put(oper.getVal(), oper);
    }

    public Function getGlobalFunction(String name) {
        return globalFuncMap.get(name);
    }

    public Map<String, Function> getGlobalFuncMap() {
        return globalFuncMap;
    }

    public Map<String, Variable> getGlobalVar() {
        return globalVar;
    }

    public Map<String, ConstString> getStringPool() {
        return stringPool;
    }

    public static Function builtinStringAdd = new Function("string.add");
    public static Function builtinStringGTH = new Function("string.gth");
    public static Function builtinStringGEQ = new Function("string.geq");
    public static Function builtinStringLEQ = new Function("string.leq");
    public static Function builtinStringLTH = new Function("string.lth");
    public static Function builtinStringEQ = new Function("string.eq");
    public static Function builtinStringNEQ = new Function("string.neq");
}
