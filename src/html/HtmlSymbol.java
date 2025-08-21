package html;

public class HtmlSymbol {
    private String name;
    private String attribute;
    private String scope;

    public HtmlSymbol(String name, String attribute, String scope) {
        this.name = name;
        this.attribute = attribute;
        this.scope = scope;
    }

    public String getName() {
        return name;
    }

    public String getAttribute() {
        return attribute;
    }

    public String getScope() {
        return scope;
    }
}
