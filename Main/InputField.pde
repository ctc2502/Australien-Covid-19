import processing.core.PVector;

class InputField {
    public int TEXTSIZE = 24;
    public int X, Y, H, W;

    /*
    InputField(PApplet p) {
        this.p = p;
    } */

    InputField(int X, int Y, int W, int H) {
        this.X = X;
        this.Y = Y;
        this.W = W;
        this.H = H;
    }
    
    public color Background = color(140, 140, 140);
    public color Foreground = color(0, 0, 0);
    public color BackgroundSelected = color(160, 160, 160);
    public color Border = color(30, 30, 30);

    public boolean BorderEnable = false;
    public int BorderWeight = 5;

    public String Text = "";
    public int TextLength = 0; 

    public boolean selected = false;




    void DRAW() {
        if (selected) {
            fill(BackgroundSelected);
        } else {
            fill(Background);
        }

        if (BorderEnable) {

            noStroke();
        } else {
            strokeWeight(BorderWeight);
            stroke(Foreground);
        }

        rect(X, Y, W, H);

        fill(Foreground);

        textSize(TEXTSIZE);
        text(Text, X + (textWidth("a") / 2), Y + TEXTSIZE);
    }

    boolean KEYPRESSED(char KEY, int KEYCODE) {
        if (selected) {
            if (KEYCODE == (int)BACKSPACE) {
                BACKSPACE();
            } else if (KEYCODE == 32) {
                addText(' ');
            } else if (KEYCODE == (int)ENTER) {
                return true;
            } else {
                boolean isKeyCapitalLetter = (KEY >= 'A' && KEY <= 'Z');
                boolean isKeySmallLetter = (KEY >= 'a' && KEY <= 'z');
                boolean isKeyNumber = (KEY >= '0' && KEY <= '9');
                boolean isKeySpecial = (KEY == '_' || KEY == '-');

                if (isKeyCapitalLetter || isKeySmallLetter || isKeyNumber || isKeySpecial) {
                    addText(KEY);
                }
            }
        }

        return false;
    }

    private void addText(char text) {
        // IF THE TEXT WIDHT IS IN BOUNDARIES OF THE TEXTBOX
        if (textWidth(Text + text) < W) {
            Text += text;
            TextLength++;
        }
    }

    private void BACKSPACE() {
        if (TextLength - 1 >= 0) {
            Text = Text.substring(0, TextLength - 1);
            TextLength--;
        }
    }

    private boolean overBox(int x, int y) {
        if (x >= X && x <= X + W) {
            if (y >= Y && y <= Y + H) {
                return true;
            }
        }

        return false;
    }

    void PRESSED(int x, int y) {
        if (overBox(x, y)) {
            selected = true;
        } else {
            selected = false;
        }
    }
}
