package html.Paragraph;

public class H_Element extends ParagraphElement {
    private String type;
    private String binding;

    public H_Element(String type, String binding) {
        this.type = type;
        this.binding = binding;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getBinding() {
        return binding;
    }

    public void setBinding(String binding) {
        this.binding = binding;
    }

    @Override
    public String toString() {
        return "H_Element{" +
                "type='" + type + '\'' +
                ", binding='" + binding + '\'' +
                '}';
    }
}
