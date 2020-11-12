import processing.core.PApplet;
import java.util.ArrayList;

class DataBroker {

    ArrayList<Data> dataList = new ArrayList<Data>();

    String[] ROWS;
    String[] HEADERS;

    DataBroker() {
    }

    void loadData() {
        ROWS = loadStrings("https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv?fbclid=IwAR1QrkDCJdrxTmOXlPJFfTlXEzQWeyJ2gj_YJNc6SYh4pgikN3V2NYaxFEA");
        HEADERS = ROWS[0].split(",");
        for (int j = 0; j < ROWS.length; j++) {
            String[] CELLS = ROWS[j].split(",");
            for (int i = 2; i < CELLS.length; i++) {
                String D = CELLS[14];
                if (D.length() == 0) D = "0";
                dataList.add(new Data(CELLS[1], D, HEADERS[i]));
                //println("Land: " + CELLS[1] + " årstal: " + HEADERS[i] + " døde: " + D);
            }
        }
    }

        public int getData(String year, String land) {
            int D = 0;
            for(int i = 0; i < dataList.size(); i++){
       //   println("year"+ dataList.get(0).year);
                if(land.equalsIgnoreCase(dataList.get(i).land) && year.equals(dataList.get(i).year) ){
                    D = Integer.parseInt(dataList.get(i).deaths);

                }
            }
            return D;
        }


    }
