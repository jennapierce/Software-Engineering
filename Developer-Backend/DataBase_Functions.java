
import ojdbc10.*; 

public class DataBase_Functions{

    enum DB_Status {
        LOGIN_SUCCESS,
        LOGIN_FAILED, 
    }

    DB_Status DB_status; 

    String username = "temp"; 
    String password = "admin"; 
    String DB_Name = "VotingMachineDB"; 

    public String LoginToDatabase(){
        DriverManager.registerDriver(new oracle.jdbc.oracleDriver()); //Explicitly registers the driver (actually an optional step)
        String url = "jdbc:oracle:oci:" +username+ "/" +password+ "@localhost:1521:" + DB_Name; //sets up the database url in required format
        Connection conn = DriverManager.getConnection(url); 
        if (conn != null){//if connection succeeds
            System.out.println("Connected"); 
            return DB_Status.LOGIN_SUCCESS.name(); //returns enum as string
        }
        else{
            return DB_Status.LOGIN_FAILED.name(); //if connection fails return login failed. 
        }
    }

}