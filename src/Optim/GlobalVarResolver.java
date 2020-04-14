package Optim;

import IR.Function;
import IR.Instruction.*;
import IR.Module;
import IR.Operand.ConstInt;
import IR.Operand.Variable;
import IR.Operand.VirReg;
import Utils.CompileOption;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/* highlight:   this class puts the load && store insts for global variables
                into a function's entry block && store block,
                and we do liveness analysis for global variables
*               1: collect liveness info
*               2: put load
*               3: put store
* */

// TODO: the liveness analysis has some problem, if , but with funcinliner, temporarily good now


public class GlobalVarResolver {
    Module program;

    private static class global_var_info {
        Map<Variable, VirReg> global_rename_map = new HashMap<Variable, VirReg>();
        Set<Variable> global_var_useset = new HashSet<Variable>();
    }

    Map<Function, global_var_info> functionglobal_var_infoMap;

    public GlobalVarResolver(Module program) {
        this.program = program;
    }

    public void run() {
        collect_use_info();
        insert_loads();
        insert_stores();
        load_store_for_call();
        insert_alloc_for_globals();
    }

    private void collect_use_info(){
        functionglobal_var_infoMap = new HashMap<Function, global_var_info>();
        for (var func : program.getGlobalFuncMap().values()) {
            if (Function.isBuiltIn(func)) continue;
            var func_var_info = new global_var_info();
            var use_set = func_var_info.global_var_useset;
            var rename_map = func_var_info.global_rename_map;
            functionglobal_var_infoMap.put(func, func_var_info);

            var RPO_BBs = func.getReversePostOrderBBs();
            for (var bb : RPO_BBs) {
                Instruction inst;
                if (bb == func.entryBB && func.getFuncname().equals("__init"))
                    inst = get_inst_head(func);
                else
                    inst = bb.insthead;
                for ( ; inst != null; inst = inst.next){
                    var useRegs = inst.getUseRegs();
                    var defReg = inst.getDefReg();
                    if (useRegs != null)
                        for (var reg : useRegs) {
                            if (reg instanceof Variable) { // global_var
                                use_set.add((Variable) reg);
                                if (! rename_map.containsKey(reg)) {
                                    VirReg tmp_global = new VirReg("_g" + reg.getName());
                                    rename_map.put((Variable) reg, tmp_global);
                                }
                            }
                        }
                    if (defReg != null) {
                        if (defReg instanceof Variable) {
                            func_var_info.global_var_useset.add((Variable) defReg);
                            if (! rename_map.containsKey(defReg)) {
                                VirReg tmp_global = new VirReg("_g" + defReg.getName());
                                rename_map.put((Variable) defReg, tmp_global);
                            }
                        }
                    }
                    inst.renameGlobal(rename_map);
                }
            }
        }
    }

    private void insert_alloc_for_globals() {
        var initFunc = program.getGlobalFuncMap().get("__init");
        var initEntryBB = initFunc.entryBB;
        for (var globalVar : program.getGlobalVar().values()) {
            initEntryBB.insthead.linkPrev(new AllocaInst(initEntryBB, globalVar, new ConstInt(CompileOption.INTSIZE)));
        }
    }

    private void insert_loads() {
        for (var func : program.getGlobalFuncMap().values()) {
            if (Function.isBuiltIn(func)) continue;
            var func_val_info = functionglobal_var_infoMap.get(func);
            var use_set = func_val_info.global_var_useset;
            var rename_map = func_val_info.global_rename_map;
            var inst_head_after_load = get_inst_head(func);
            for (var global_var : use_set) {
                var global_tmp_vir = rename_map.get(global_var);
                inst_head_after_load.linkPrev(new LoadInst(func.entryBB, global_tmp_vir, global_var));
            }
        }
    }

    private void insert_stores() {
        for (var func : program.getGlobalFuncMap().values()) {
            if (Function.isBuiltIn(func)) continue;
            var func_val_info = functionglobal_var_infoMap.get(func);
            var use_set = func_val_info.global_var_useset;
            var rename_map = func_val_info.global_rename_map;
            var inst_tail = func.exitBB.insttail;
            for (var global_var : use_set) {
                var global_tmp_vir = rename_map.get(global_var);
                inst_tail.linkPrev(new StoreInst(func.exitBB, global_var, global_tmp_vir));
            }
        }
    }

    private void load_store_for_call() {
        for (var func : program.getGlobalFuncMap().values()) {
            if (Function.isBuiltIn(func)) continue;
            var func_val_info = functionglobal_var_infoMap.get(func);
            var use_set = func_val_info.global_var_useset;
            var rename_map = func_val_info.global_rename_map;
            var RPOBBs = func.getReversePostOrderBBs();
            for (var bb : RPOBBs) {
                for (var inst = bb.insthead; inst != null; inst = inst.next) {
                    if (inst instanceof FuncCallInst) {
                        var Calling = ((FuncCallInst) inst).callTo;
                        for (var global_var : use_set) {
                            if (Function.isBuiltIn(Calling) || (!functionglobal_var_infoMap.get(Calling).global_var_useset.contains(global_var)))
                                continue;
                            var global_tmp_vir = rename_map.get(global_var);
                            inst.linkPrev(new StoreInst(bb, global_var, global_tmp_vir));
                            inst.linkNext(new LoadInst(bb, global_tmp_vir, global_var));
                        }
                    }
                }
            }
        }
    }

    private Instruction get_inst_head(Function func) {
        return  func.entryBB.insthead;
    }
}