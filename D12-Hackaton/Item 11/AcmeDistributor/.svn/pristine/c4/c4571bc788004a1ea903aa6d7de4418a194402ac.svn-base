package controllers.customer;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.net.MalformedURLException;
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

import security.LoginService;
import security.UserAccount;
import services.CustomerService;
import services.InvoiceService;
import services.ShoppingCartService;
import services.TaxService;
import controllers.AbstractController;
import controllers.TaxController;
import domain.Customer;
import domain.Invoice;
import domain.Item;
import domain.Money;
import domain.ShoppingCart;
import domain.ShoppingLine;
import domain.Tax;
import forms.InvoiceForm;

@Controller
@RequestMapping("/invoice/customer")
public class InvoiceCustomerController extends AbstractController{
	@Autowired
	private InvoiceService invoiceService;
	@Autowired
	private ShoppingCartService shoppingCartService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private TaxService  taxService;
	
	//Listing------------------------
	@RequestMapping("/myInvoices")
	public ModelAndView list(){
		ModelAndView result;
		Collection<Invoice> invoices=invoiceService.findByCustomer();			
		String requestURI="invoice/customer/list.do";	
		
		result = new ModelAndView("invoice/customer/myInvoices");
		result.addObject("invoices",invoices);
		result.addObject("requestURI",requestURI);
		result.addObject("isProducer", false);
		
		return result;
	}	
	//Creation----------------------
	@RequestMapping(value="/create",method=RequestMethod.GET)
	public ModelAndView create(){
		ModelAndView result;
		ShoppingCart shoppingCart=shoppingCartService.findByShoppingCustomer();
		
		
		InvoiceForm invoiceForm = invoiceService.construct(shoppingCart);
		Assert.notNull(invoiceForm);
		
		result = createEditModelAndView(invoiceForm);
		
		return result;
	}
	@RequestMapping(value="/create",method=RequestMethod.POST,params="save")		
	public ModelAndView save(@Valid InvoiceForm invoiceForm, BindingResult binding){
		ModelAndView result;
		
		if(binding.hasErrors()){
			result=createEditModelAndView(invoiceForm);
		} else{
			try{
				Invoice invoice=invoiceService.create(invoiceForm.getShoppingCart());
				invoiceService.save(invoice);
				result=new ModelAndView("redirect:myInvoices.do");
			} catch(Throwable oops){
				result=createEditModelAndView(invoiceForm,"invoice.commit.error");
			}
		}
		return result;
	}
	
	//Details----------------------
	@RequestMapping(value= "/details", method = RequestMethod.GET)
	public ModelAndView details(@RequestParam int invoiceId){
		ModelAndView result;
		
		Invoice invoice = invoiceService.findOne(invoiceId);
		Assert.notNull(invoice);
		Customer customer=invoice.getCustomer();		
		Collection<ShoppingLine> lines=invoice.getLines();
		Collection<Tax> taxes=taxService.findAll();
		String orderNumber=invoice.getOrderNumber();
		Money totalPrice=invoice.getTotalPrice();
		
		result=new ModelAndView("invoice/customer/details");
		
		
		result.addObject("invoice", invoice);
		result.addObject("customer", customer);
		result.addObject("invoiceLines", lines);
		result.addObject("taxes", taxes);
		result.addObject("orderNumber",orderNumber);
		result.addObject("totalPrice",totalPrice);
		
		return result;
	}
	
	
	
	
	//Ancillary methods
	protected ModelAndView createEditModelAndView(InvoiceForm invoiceForm){
		ModelAndView result;
		result=createEditModelAndView(invoiceForm,null);		
		return result;
	}
	
	protected ModelAndView createEditModelAndView(InvoiceForm invoiceForm, String message){
		ModelAndView result;
		String requestURI="invoice/customer/create.do";
		Collection<Tax> taxes=taxService.findAll();
		result=new ModelAndView("invoice/customer/edit");
		result.addObject("requestURI",requestURI);
		result.addObject("invoiceForm", invoiceForm);
		result.addObject("taxes",taxes);
		result.addObject("invoiceLines", invoiceForm.getShoppingCart().getLines());
		return result;
	}
}
