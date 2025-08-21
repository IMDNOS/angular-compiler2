package html.DivAttribute;

public class ClassOrId extends DivAttribute {
    private String attribute;

    public ClassOrId(String attribute) {
        this.attribute = attribute;
    }

    public String getAttribute() {
        return attribute;
    }

    public void setAttribute(String attribute) {
        this.attribute = attribute;
    }

    @Override
    public String toString() {
        return attribute;
    }
}
