package AST;

import FrontEnd.ASTVisitor;
import FrontEnd.Semantic.Entity.Entity;
import FrontEnd.Semantic.Entity.FunctionEntity;
import Utils.Location;

public class MemberExprNode extends ExprNode {
    ExprNode whose;
    String memberID;

    Entity whoseEntity;
    Entity memberEntity;

    public MemberExprNode(Location location, ExprNode whose, String memberID) {
        super(location);
        this.whose = whose;
        this.memberID = memberID;
        this.whoseEntity = null;
    }

    public String getmemberID() {
        return memberID;
    }

    public ExprNode getWhose() {
        return whose;
    }

    public void setMemberEntity(Entity memberEntity) {
        this.memberEntity = memberEntity;
    }

    public Entity getMemberEntity() {
        return memberEntity;
    }

    // for a memberExpr :
    // a.x : variable entity
    // a.add(b) : function entity
    public void setwhoseEntity(Entity whoseEntity) {
        this.whoseEntity = whoseEntity;
    }

    public Entity getWhoseEntity() {
        return this.whoseEntity;
    }

    @Override
    public void accept(ASTVisitor visitor) throws Exception {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return "MemberExprNode{" +
                "whose=" + whose +
                ", memberID='" + memberID + '\'' +
                ", whoseEntity=" + whoseEntity +
                '}';
    }
}
