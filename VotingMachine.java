/*
 *  VotingMachine.java
 * implements a simple voting machine for a single choice of two candidates
 * Andrew Wolfe
 */
import java.io.PrintStream;
import java.io.PrintWriter;

class VotingMachine {
    enum Candidate {
        JOHN_ADAMS,
        THOMAS_JEFFERSON,
        JAMES_MADISON
    }

    int [] votes = new int [Candidate.values().length];

    void voteFor (Candidate candidateFor) {
        votes [candidateFor.ordinal()]++;
    }

    void reportVotes(PrintStream outPut) {
        for (Candidate thisCand: Candidate.values()) {
            outPut.print ("Candidate: ");
            outPut.print (thisCand);
            outPut.println (": " + votes [thisCand.ordinal()]);
        }
    }

    void reportVotes(PrintWriter outPut) {
        for (Candidate thisCand: Candidate.values()) {
            outPut.print ("Candidate: ");
            outPut.print (thisCand);
            outPut.println (": " + votes [thisCand.ordinal()] + " <br />");
        }
    }

    void reportVotes () {
        reportVotes(System.out);
    }
}