package com.oms.web.rest;

import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.oms.web.beans.Custodian;
import com.oms.web.beans.ResponsePage;
import com.oms.web.service.ClientService;
import com.oms.web.service.CustodianService;
import com.oms.web.beans.Client;



@RestController
//@CrossOrigin(origins = "http://localhost:4200")
@CrossOrigin(origins = "http://localhost:4200", allowCredentials = "true")
@RequestMapping(value = "/custodian", method = RequestMethod.POST)

public class CustodianRestController {
	@Autowired
	private CustodianService custodianService;
	
	@Autowired
	private ClientService clientService;
	
	@GetMapping("/{id}")
	public ResponseEntity<Object> getAllClientsByCustodianId(@PathVariable String id)
	{
		try { 
			List<Client> clients = this.clientService.getAllClientsByCustodianId(id);
			return ResponseEntity.status(HttpStatus.OK)
					.body(clients);
					
			
		}catch (EntityNotFoundException e) {
			System.out.println("error");
			return ResponseEntity.status(HttpStatus.NOT_FOUND)
					.body(new ResponsePage("failure", e.getMessage()));
		}
	}
	

	@PostMapping
	public ResponseEntity<Object> checkUser(@RequestBody Custodian user) {
		Custodian custodian;
		if ((custodian = this.custodianService.checkUser(user)) != null) {
			return ResponseEntity.status(HttpStatus.OK)
					.body(custodian);
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND)
					.body(new ResponsePage("Failed","User with "+user.getCustodianname()+" does not exists"));
		}
	}
	

}
