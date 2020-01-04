// Import required java libraries
import java.io.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Extend HttpServlet class
public class VotingServlet extends HttpServlet {
    static final long serialVersionUID = 202001012034L;

    private static VotingMachine theseVotes = new VotingMachine();

    @Override
    public void init() throws ServletException {
        // Do any required initialization
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {

        // Set response content type
        response.setContentType("text/html");

        // Actual logic goes here.
        PrintWriter out = response.getWriter();
        out.println("<html> <head> <title> Voting Machine </title> </head>");
        out.println("<h1> Voting Machine </h1>");
        out.println("Now adding test votes");
        theseVotes.voteFor(VotingMachine.Candidate.JOHN_ADAMS);
        theseVotes.voteFor(VotingMachine.Candidate.JOHN_ADAMS);
        theseVotes.voteFor(VotingMachine.Candidate.THOMAS_JEFFERSON);
        theseVotes.reportVotes(out);
        out.println ("</html>");
    }

    @Override
    public void destroy() {
        // do nothing.
    }
}