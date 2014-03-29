package arithmeticdfa;

public class State {
	private int id;
	private boolean isAccepting;

	public State(int id, boolean accepting){
		this.id = id;
		this.isAccepting = accepting;
	}
	public int getId(){
		return this.id;
	}
	public boolean getAcceptance(){
		return  this.isAccepting;
	}

}
