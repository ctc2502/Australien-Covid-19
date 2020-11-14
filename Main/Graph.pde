
class Graph {

    public void DRAW(DataBroker DB, InputField country, InputField topic){
        pushMatrix();
        scale((float) 1);
        translate(0, 0);
        //for (int i = 0; i < 46; i++) {
            String topicString = topic.Text;
            country.Text = "Australia";
                stroke(193,39,45);
                fill(193,39,45);
                if (fyld > -DB.getData(topicString,country.Text)/30) {
                fyld = fyld - 10;
                } else if (fyld < -DB.getData(topicString,country.Text)/30) {
                fyld = fyld + 10;
                }
                rect(0,1060,1920, fyld);
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
        text("Relevant topics: ", x-200,y+350);
    }
}
