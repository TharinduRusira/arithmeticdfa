package arithmeticdfa;

import java.util.ArrayList;

public class DFASimulator {

	public static void main(String[] args) {

	}
	
	public ArrayList<Symbol> initSymbols(){
		ArrayList<Symbol> symbols = new ArrayList<Symbol>();
		for(int i=0;i<10;i++){
			symbols.add(new Symbol(String.valueOf(i))); // add digits 0-9
		}
		symbols.add(new Symbol("+")); // addition
		symbols.add(new Symbol("-")); // subtraction
		symbols.add(new Symbol("*")); // multiplication
		symbols.add(new Symbol("/")); // division
		symbols.add(new Symbol(".")); // decimal point
		return symbols;
	}
	
	public ArrayList<Transition> initTransitions(){
		ArrayList<Transition> transitions = new ArrayList<Transition>();
		ArrayList<State> states = initStates(); // get the states in dfa
		// now add the transitions
		
		
		
		return transitions;
	}
	
	public ArrayList<State> initStates(){
		ArrayList<State> states = new ArrayList<State>();
		// we need 2 states for this problem 
		states.add(new State(1,false));
		states.add(new State(2, true));
		
		return states;
	}

}
