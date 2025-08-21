package html.DivChild;

public class ImageElement extends DivChild {
    private String id;
    private String attribute;

    public ImageElement(String id, String attribute) {
        this.id = id;
        this.attribute = attribute;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAttribute() {
        return attribute;
    }

    public void setAttribute(String attribute) {
        this.attribute = attribute;
    }

    @Override
    public String toString() {
        return "ImageElement{" +
                "id='" + id + '\'' +
                ", attribute='" + attribute + '\'' +
                '}';
    }
}
