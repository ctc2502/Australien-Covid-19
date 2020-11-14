
class Graph {

    public void DRAW(DataBroker DB, InputField country, InputField year){
        pushMatrix();
        scale((float) 0.5);
        translate(0, 1025);
        //for (int i = 0; i < 46; i++) {
            String yearString = year.Text;
            country.Text = "Australia";
                stroke( (year.Text.equalsIgnoreCase(yearString)) ? 0xffffff00 : 255);
                fill( (year.Text.equalsIgnoreCase(yearString)) ? 0xffffff00 : 255);
                println(DB.getData(yearString,country.Text));
                
            if (keyCode == ENTER) {
            rect(i,height-55,10, -DB.getData(yearString,country.Text));
            println(i);
            }
            fill(0,0,0);
        //}

        popMatrix();
    }

    public void display(int x, int y) {
        strokeWeight(5);
        stroke(0);
        line(30, height-50, width-30, height-50);
        line(30, 200, 30, height-50);
        strokeWeight(2);

        textSize(20);
        text("<< 1900",50,height-25);
        text("2014 >>",width-120,height-25);
        textSize(32);
        fill(255);
        text("Country",x,y-10);
        text("Year",x,y+90);
        textSize(20);
        fill(0);
        text("Deaths",10,180);
    }
}
