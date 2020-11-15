
class Graph {
    public color riskyRed = color(193,39,45);
    public color yeasyYellow = color(251, 176, 59);
    
    public void DRAW(DataBroker DB, InputField country, InputField topic){
        pushMatrix();
        scale((float) 1);
        translate(0, 0);
        //for (int i = 0; i < 46; i++) {
            String topicString = topic.Text;
            country.Text = "Australia";
                //stroke(193,39,45);
                fill( (fyld > -500) ? yeasyYellow : riskyRed);
                
                if (fyld > -DB.getData(topicString,country.Text)/30) {
                fyld = fyld - 10;
                } else if (fyld < -DB.getData(topicString,country.Text)/30) {
                fyld = fyld + 10;
                }
                rect(0,1062,1920, fyld);
                println(fyld);
                //println(DB.getData(topicString,country.Text));
            if (keyCode == ENTER) {
            
            //println(i);
            }
            fill(0,0,0);
        //}

        popMatrix();
    }

    public void display(int x, int y) {
        int d = day();
        int m = month();
        int yr = year();
        
        String s = String.valueOf(d) + " / " + String.valueOf(m) + " / " + String.valueOf(yr);
        
        strokeWeight(5);
        textSize(32);
        fill(255);
        text("Type in a command",x,y-10);
        fill(252, 238, 33);
        textSize(16);
        text("Latest updated: " + s, x, y+65);
        
        fill(255);
        textSize(32);
        text("Relevant topics [Command] ", x-250,y+350);
        text("Covid-19 Cases nationwide [total_cases]", x-250,y+390);
        text("Covid-19 Deaths nationwide [total_deaths]", x-250,y+425);
    }
}
