package html.DivChild;

import java.util.List;

public class LabelElement extends DivChild {
    private String id;
    private List<DivChild> children;

    public LabelElement(String id, List<DivChild> children) {
        this.id = id;
        this.children = children;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public List<DivChild> getChildren() {
        return children;
    }

    public void setChildren(List<DivChild> children) {
        this.children = children;
    }

    @Override
    public String toString() {
        return "LabelElement{" +
                "id='" + id + '\'' +
                ", children=" + children +
                '}';
    }
}
