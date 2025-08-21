package html.DivAttribute;

public class NgDirective extends DivAttribute {
    private String directive;

    public NgDirective(String directive) {
        this.directive = directive;
    }

    public String getDirective() {
        return directive;
    }

    public void setDirective(String directive) {
        this.directive = directive;
    }

    @Override
    public String toString() {
        return directive;
    }
}
