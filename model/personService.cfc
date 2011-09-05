component 
{
	
	person function getPerson(int id){
		var person = entityLoadByPK("person",id);
		return person;
	}	
	boolean function save(person obj){
		try { 
		    EntitySave(obj); 
		    ormflush(); 
		} 
		catch(Exception ex) { 
		   return false; 
		}
		return true;
	}
	
	boolean function delete(int id){
		var person = entityLoadByPK("person",arguments.id);
		if(isDefined("person")){
			entityDelete(person);
		}
		return true;
	}
	
	array function getPersons(int id,
					string firstName,
					string lastName, 
					string email, 
					pagesize="10", 
					currentpage=1,
					sortby="id",
					sortorder ="asc"){
		var filtered =structNew();
		var options = {offset=((arguments.currentpage-1)*arguments.pagesize),maxResults=arguments.pagesize};
		if(structKeyExists(arguments,"id") and val(arguments.id))
			filtered.id = arguments.id;
		if(structKeyExists(arguments,"firstName") and len(arguments.firstName))
			filtered.id = arguments.firstName;
		if(structKeyExists(arguments,"lastName") and len(arguments.lastName))
			filtered.id = arguments.lastName;
		if(structKeyExists(arguments,"email") and len(arguments.id))
			filtered.id = arguments.email;
		var arrPerson = entityLoad("person",
									filtered,
									"#arguments.sortBy# #arguments.sortOrder#",
									options
								);
		return arrPerson;
	}
}