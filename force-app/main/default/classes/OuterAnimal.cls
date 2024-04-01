public class OuterAnimal {

	public class Animals {
		public Integer id;
		public String name;
		public String eats;
		public String says;
	}

	public Animals animal;

	
	public static OuterAnimal parse(String json) {
		return (OuterAnimal) System.JSON.deserialize(json, OuterAnimal.class);
	}
}