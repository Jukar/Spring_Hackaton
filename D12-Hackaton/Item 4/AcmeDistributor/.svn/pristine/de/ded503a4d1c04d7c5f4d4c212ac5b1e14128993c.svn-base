package controllers;

import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.WarehouseService;

import controllers.AbstractController;
import domain.Distributor;
import domain.Item;
import domain.Tax;
import domain.Warehouse;

@Controller
@RequestMapping("/warehouse")
public class WarehouseController extends AbstractController {
//Services --------------------------------------------------
	@Autowired
	private WarehouseService warehouseService;
	
//Listing------------------------
	@RequestMapping("/list")
	public ModelAndView list() {
		ModelAndView result;
		
		Collection<Warehouse> warehouses;
		warehouses=warehouseService.findAll();
		String requestURI="warehouse/list.do";
			
		result = new ModelAndView("warehouse/list");
		result.addObject("warehouses",warehouses);
		result.addObject("requestURI",requestURI);
		return result;
	}
	
}
