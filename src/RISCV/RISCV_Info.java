package RISCV;

import IR.Operand.VirReg;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class RISCV_Info {
    public static Set<String> phyRegs = Set.of( "zero","ra","sp","gp","tp",
                                                "t0","t1","t2","s0","s1",
                                                "a0","a1","a2","a3","a4","a5","a6","a7",
                                                "s2","s3","s4","s5","s6","s7","s8","s9","s10","s11",
                                                "t3","t4","t5","t6");

    public static Set<String> calleeSavedRegs = Set.of("s0","s1","s2","s3","s4","s5","s6","s7","s8","s9","s10","s11");
    public static Set<String> argRegs = Set.of("a0","a1","a2","a3","a4","a5","a6","a7");
    public static Set<String> callerSavedRegs = Set.of( "ra","t0","t1","t2",
                                                        "a0","a1","a2","a3","a4","a5","a6","a7",
                                                        "t3","t4","t5","t6" );
    public static String[] AllocableRegister = {"ra","t0","t1","t2",
                                                "s0","s1",
                                                "a0","a1","a2","a3","a4","a5","a6","a7",
                                                "s2","s3","s4","s5","s6","s7","s8","s9","s10","s11",
                                                "t3","t4","t5","t6"};
    public static Map<String, VirReg> virtualPhyRegs = new HashMap<String, VirReg>();

    public static Set<VirReg> virtualCalleeSavedRegs = new HashSet<>();
    public static Set<VirReg> virtualCallerSavedRegs = new HashSet<>();
    public static Set<VirReg> virtualargRegs = new HashSet<>();
    public static Set<VirReg> virtualAllocableRegs = new HashSet<>();

    public static Set<PhyReg> phycalleeSavedRegs = new HashSet<>();
    public static Set<PhyReg> phycallerSavedRegs = new HashSet<>();
    public static Map<String, PhyReg> physicalRegs = new HashMap<>();

    public RISCV_Info() {
        for (var name : phyRegs) {
            var newVir = new VirReg(name);
            var newPhy = new PhyReg(name);
            newVir.color = newPhy;
            virtualPhyRegs.put(name, newVir);
            physicalRegs.put(name, newPhy);
        }
        for (var name : calleeSavedRegs) {
            virtualCalleeSavedRegs.add(virtualPhyRegs.get(name));
            phycalleeSavedRegs.add(physicalRegs.get(name));
        }
        for (var name : callerSavedRegs) {
            virtualCallerSavedRegs.add(virtualPhyRegs.get(name));
            phycallerSavedRegs.add(physicalRegs.get(name));
        }
        for (var name : argRegs)
            virtualargRegs.add(virtualPhyRegs.get(name));
        for (var name : AllocableRegister)
            virtualAllocableRegs.add(virtualPhyRegs.get(name));
    }

}
