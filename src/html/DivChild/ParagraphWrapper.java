package html.DivChild;

import html.Paragraph.ParagraphElement;

public class ParagraphWrapper extends DivChild {
    private ParagraphElement paragraph;

    public ParagraphWrapper(ParagraphElement paragraph) {
        this.paragraph = paragraph;
    }

    public ParagraphElement getParagraph() {
        return paragraph;
    }

    public void setParagraph(ParagraphElement paragraph) {
        this.paragraph = paragraph;
    }

    @Override
    public String toString() {
        return paragraph.toString();
    }
}
