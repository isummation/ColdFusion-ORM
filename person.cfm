<cfscript>
	structAppend(form,url,true);
	personService = createObject("component","orm.model.personService");
	if(structKeyExists(form,"event")){
		
		if(form.event == "save"){
			obj = createObject("component","orm.model.person");		
			if(val(form.id))
				obj.setId(form.id);
			obj.setfirstname(form.firstName); 
		    obj.setlastname(form.lastName); 
		    obj.setemail(form.email);
		    personservice.save(obj);
		    structClear(form);		
		}
		else if(form.event == "load"){
			obj = personService.getPerson(form.id);
			form.id = obj.getId();
			form.firstname = obj.getFirstName();
			form.lastName = obj.getLastName();
			form.email = obj.getEmail();		
		}
		else if(form.event == "delete"){
			obj = personService.delete(form.id);
			form.id = "";
		}
	}
	arrPerson =  personService.getPersons();
	randnum = randRange(1,100000000);
	param name="form.id" default="";
	param name="form.firstname" default="Pritesh#randnum#";
	param name="form.lastName" default="Patel#randnum#";
	param name="form.email" default="pritesh#randnum#@isummation.com";
</cfscript>
<cfoutput>
<html>
	<head></head>
	<body>
		<form name="frmperson" method="post" action="person.cfm">
			<input type="hidden" name="event" value="save"/>
			<input type="hidden" name="id" value="#form.id#"/>
			<table>
				<tr>
					<td>First Name:</td>
					<td><input type="text" name="firstName" value="#form.firstname#"/></td>
				</tr>
				<tr>
					<td>Last Name:</td>
					<td><input type="text" name="lastName" value="#form.lastName#"/></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input type="text" name="email" value="#form.email#"/></td>
				</tr>
				<tr>
					<td><input type="submit" value="Submit" name="submitMe"/></td>
				</tr>
			</table>			
		</form>	
		<table>
			<tr>
				<th>ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>				
			</tr>
		<cfloop from="1" to="#arrayLen(arrPerson)#" index="i">
			<tr>
				<td>#arrPerson[i].getId()#</td>
				<td>#arrPerson[i].getFirstName()#</td>
				<td>#arrPerson[i].getLastName()#</td>
				<td>#arrPerson[i].getEmail()#</td>				
			</tr>
		</cfloop>
		</table>
	</body>
</html>
</cfoutput>
