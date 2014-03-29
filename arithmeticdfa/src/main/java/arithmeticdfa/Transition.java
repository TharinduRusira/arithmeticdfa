package arithmeticdfa;

public class Transition {
	private State from;
	private State to;
	private Symbol input;
	
	public Transition(State from, State to,Symbol input){
		this.from = from;
		this.to = to;
		this.input = input;
	}
	
	public State getFrom(){
		return this.from;
	}
	public State getTo(){
		return this.to;				
	}
	public Symbol getInput(){
		return this.input;
	}

}
