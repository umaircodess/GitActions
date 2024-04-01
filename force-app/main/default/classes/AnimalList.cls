public with sharing class AnimalList {
    	public List<String> animals;

	
	public static AnimalList parse(String json) {
		return (AnimalList) System.JSON.deserialize(json, AnimalList.class);
	}


    }