package html.DivChild;

public class BrTag extends DivChild {
    private String id;
    private String binding;

    public BrTag(String id, String binding) {
        this.id = id;
        this.binding = binding;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBinding() {
        return binding;
    }

    public void setBinding(String binding) {
        this.binding = binding;
    }

    @Override
    public String toString() {
        return "BrTag{" +
                "id='" + id + '\'' +
                ", binding='" + binding + '\'' +
                '}';
    }
}
