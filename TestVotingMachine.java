import static org.junit.Assert.assertEquals;
import org.junit.Test; //execute file for testing

public class TestVotingMachine {
    //this main section can not be tested yet
    public static void main (String [] Arguments) {
        System.out.println("Starting up " + java.lang.invoke.MethodHandles.lookup().lookupClass().getName());
        VotingMachine machine = new VotingMachine();
        machine.reportVotes();
        System.out.println("Now adding test votes");
        machine.voteFor(VotingMachine.Candidate.JOHN_ADAMS);
        machine.voteFor(VotingMachine.Candidate.JOHN_ADAMS);
        machine.voteFor(VotingMachine.Candidate.THOMAS_JEFFERSON);
        machine.reportVotes();
        System.out.println("Finished voting-machine test");
    }

    @Test //label section for test
    public void testadd(){
        String str = "JUnit is working";
        assertEquals("JUnit is working", str); //JUnit test
    }
}