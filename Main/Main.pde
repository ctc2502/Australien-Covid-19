import processing.core.PApplet;
import java.util.ArrayList;

    DataBroker DB = new DataBroker();
    Graph G = new Graph();

    InputField country = new InputField(900, 50, 400, 35);
    InputField year = new InputField(900, 150, 400, 35);

    ArrayList<InputField> textboxes = new ArrayList<InputField>();

    boolean send = false;
    String msg;
    String msg2;
    int x = 1300;

    public void settings() {
        //size(1000, 1000);
        fullScreen();
    }

    public void setup() {
        super.setup();
                DB.loadData();

        textboxes.add(year);
        textboxes.add(country);

    }

    public void draw() {

        clear();
        background(0,150,175);


        G.DRAW(DB,country,year);
        G.display(country.X, country.Y);


        //Felter bliver tegnet
        for (InputField t : textboxes) {
            t.DRAW();
        }

        //WOW ANIMATION
        if (send) {
            fill(255);
            if (x > country.X) {
                x = x-10;
            }
            text(msg, (x+200 - textWidth(msg)), 260);
        }
        
    }

    public void keyPressed() {
        super.keyPressed();
        for (InputField t : textboxes) {
            if (t.KEYPRESSED(key, keyCode)) {
                send = true;
                msg = "Land: " + textboxes.get(1).Text + "\n" + "År: " + textboxes.get(0).Text + "\n" + "Dødsfald: " + DB.getData(year.Text,country.Text);
            }
        }
    }

    public void mousePressed() {
        super.mousePressed();
        for (InputField t : textboxes) {
            t.PRESSED(mouseX, mouseY);
        }
    }
